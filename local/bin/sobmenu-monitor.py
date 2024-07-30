#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from os import environ
from os.path import exists, join, expanduser, isdir, islink


SYSD_DIR = join( expanduser("~"), ".config/systemd/user" )
applications_dirs = [ join( expanduser("~"), ".local/share/applications" ) ]

for share in environ["XDG_DATA_DIRS"].split(":"):
    apps = join(share, "applications")

    # Application dirs
    if exists(apps) and ( isdir(apps) or islink(apps) ):
        applications_dirs.append(apps)

with open( join( SYSD_DIR, "sobmenu-monitor.path" ), "w" ) as fout:
    fout.write("[Unit]\nDescription=Triggers the service that update sobmenu cache\nDocumentation= man:systemd.path\n\n[Path]\n")

    for app in applications_dirs:
        fout.write("PathModified=" + app + "\n")

    fout.write("\n[Install]\nWantedBy=multi-user.target\n")

with open( join( SYSD_DIR, "sobmenu-monitor.service" ), "w" ) as fout:
    fout.write('''[Unit]
Description=Monitoring applications directory for changes
Documentation= man:systemd.service

[Service]
Type=oneshot
ExecStart=bash /media/Apps/so-config/local/bin/sobmenu-monitor.sh ; python3 /media/Apps/so-config/config/openbox/sobmenu.py -m -w labwc -i -s''')
