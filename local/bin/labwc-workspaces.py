#!/usr/bin/env python3

import xml.etree.ElementTree as et
from os.path import join, expanduser
import time, argparse, sys
import json

rcfile = join( expanduser("~"), ".config/labwc/rc.xml" )
rctree = et.parse(rcfile)
rcroot = rctree.getroot()
desks  = rcroot.find("{*}desktops")
num = desks.get("number")
names = desks.findall("{*}names/{*}name")
lnames = [ i.text for i in names ]
if not num:
    num = len(names)

# capslock altgr logo hyper meta
meta_keys = {
    "A": "alt",         # Mod1
    "C": "ctrl",
    "H": "",        # Mod3
    "M": "altgr",        # Mod5
    "S": "shift",
    "W": "win"          # Mod4, super_L
    }

def get_workspace_number():
    return num

def get_workspace_names():
    return lnames

def get_wtype(keyb):
    l = keyb.split("-")
    cmd = "wtype "
    for i in l:
        if i in meta_keys:
            cmd += "-M " + meta_keys[i] + " "
        else:
            cmd += "-P " + i + " "
    return cmd

def get_keybinds(action_name):
    keybinds = rcroot.findall("{*}keyboard/{*}keybind")
    action_binds = {}

    if keybinds:
        for key in keybinds:
            k = key.get("key")
            wtype = get_wtype(k)
            actions = key.findall("{*}action[name='" +action_name + "']" )
            print(k)
            print(wtype)
            print(action_name)
            if actions:
                for action in actions:
                    if action.get("name") == action_name:
                        if action_name == "Execute":
                            cmds = action.findall("{*}command")
                            if cmds:
                                for cmd in cmds:
                                    print(cmd.text)
                                    print("-----")
                        else:
                            tos = action.findall("{*}to")
                            if tos:
                                for ato in tos:
                                    if ato.text not in ["current", "left", "right", "last"]:
                                        action_binds[ato.text] = wtype
                                        print(action.get("name"))
                                        print(ato.tag)
                                        print(ato.text)
                                        print("-----")

                                    # print("label \"lwc_" + ato.text + "\" {\n style =  \"desk\"\n value = \"" + ato.text + "\" \n action = \"" + get_wtype(k) + "\"\n}")
                                    # print("---------------------------")
    return action_binds

def get_keybinds(action_name):
    keybinds = rcroot.findall("{*}keyboard/{*}keybind")
    action_binds = {}

    if keybinds:
        for key in keybinds:
            k = key.get("key")
            wtype = get_wtype(k)
            actions = key.findall("{*}action" )
            if actions:
                for action in actions:
                    if action.get("name") == action_name:
                        if action_name == "Execute":
                            cmd = action.get("command")
                            cmds = action.findall("{*}command")
                            if cmd:
                                action_binds[cmd] = wtype
                            else:
                                if cmds:
                                    for cm in cmds:
                                        action_binds[cm.text] = wtype
                        else:
                            tos = action.findall("{*}to")
                            if tos:
                                for ato in tos:
                                    if ato.text not in ["current", "left", "right", "last"]:
                                        action_binds[ato.text] = wtype
    return action_binds

def usage():
    print( "Usage: " + sys.argv[0] + " --ws-num | --ws-names | --ws-names-lines | --ws-json | --ws-keys ActionName" )

if __name__ == "__main__":
    if len( sys.argv ) <= 1:
        usage()
    else:
        if sys.argv[1] == "--ws-num":
            print(num)
        elif  sys.argv[1] == "--ws-names":
            print(lnames)
        elif sys.argv[1] == "--ws-names-lines":
            for i in lnames:
                print(i)
        elif sys.argv[1] == "--ws-json":
            json_str = '{ "number": ' + str(num) + ', "names": ['
            json_names = ""
            for i in lnames:
                json_names += f'"{i}", '

            json_str += json_names.rstrip(", ") + "] }"
            print(json_str)
        elif sys.argv[1] == "--ws-keys":
            if sys.argv[2]:
                actions = get_keybinds(sys.argv[2])
                #print(json.dumps(actions))

            else:
                usage()
        elif sys.argv[1] == "--ws-sfwbar":
            with open("/tmp/number_ws.txt", "w") as fout:
                fout.write( str(num) + "\n" )
            actions = get_keybinds("GoToDesktop")
            print('grid "labwc_ws" { \n style = "desktops" \n css = "* { -GtkWidget-direction: right; }"\n')
            #print('grid "labwc_ws" {\n')
            for i in actions:
                print('label "lwc_' + i + '" {\n style = If(CurrentWS = ' + i + ', "desk_active", "desk")\n value = "' + i + '" \n action = "' + actions[i] + '"\n}')
            print('}')

        else:
            usage()
