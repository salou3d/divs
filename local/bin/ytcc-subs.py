#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from os import system
import concurrent.futures as cf

yt_channels = {
    "Life Uncontained"     : "https://www.youtube.com/@life.uncontained/videos",
    "Linus Tech Tips"      : "https://www.youtube.com/@LinusTechTips/videos",
    "Techquickie"          : "https://www.youtube.com/@techquickie/videos",
    "DistroTube"           : "https://www.youtube.com/@DistroTube/videos",
    "The Linux Experiment" : "https://www.youtube.com/@TheLinuxEXP/videos",
    "The Linux Cast"       : "https://www.youtube.com/@TheLinuxCast/videos",
    "Chris Titus Tech"     : "https://www.youtube.com/@ChrisTitusTech/videos",
    "Jeff Geerling"        : "https://www.youtube.com/@JeffGeerling/videos",
    "Geerling Engineering" : "https://www.youtube.com/@GeerlingEngineering/videos",
    "LinuxScoop"           : "https://www.youtube.com/@linuxscoop/videos",
    "TechHut"              : "https://www.youtube.com/@TechHut/videos",
    "Learn Linux TV"       : "https://www.youtube.com/@LearnLinuxTV/videos",
    "No Boilerplate"       : "https://www.youtube.com/@NoBoilerplate/videos",
    "NetworkChuck"         : "https://www.youtube.com/@NetworkChuck/videos",
    "typecraft"            : "https://www.youtube.com/@typecraft_dev/videos",
    "Brodie Robertson": "https://www.youtube.com/@BrodieRobertson/videos",
    "JayzTwoCents"         : "https://www.youtube.com/@Jayztwocents/videos",

    "my mechanics"         : "https://www.youtube.com/@mymechanics/videos",
    "my mechanics insights": "https://www.youtube.com/@mymechanicsinsights/videos",
    "Koss"                 : "https://www.youtube.com/@Koss-channel/videos",
    "Little King Goods"    : "https://www.youtube.com/@LittleKingGoods/videos",
    "Kingdom Glory Leather": "https://www.youtube.com/@KingdomGloryLeather/videos",
    "The Leathercraft Academy": "https://www.youtube.com/@Theleathercraftacademy/videos",
    "Road Agent Leather"   : "https://www.youtube.com/@RoadAgentLeather/videos",
    "Wild Leather Craft"   : "https://www.youtube.com/@wildleathercraft/videos",
    "J.H.Leather"          : "https://www.youtube.com/@JHLeather/videos",
    "Plan.B Leather": "https://www.youtube.com/@plan.b/videos",
    "Knives Project": "https://www.youtube.com/@knivesproject3349/videos",

    "AJ+ كبريت"            : "https://www.youtube.com/@AJpluskibreet/videos",
    "Mokhbir Eqtisadi - المخبر الاقتصادي" :
        "https://www.youtube.com/@MokhbirEqtisadi/videos",
    "خمسينة اقتصاد":
        "https://www.youtube.com/@Khamsint_ektesad/videos",
    "المواطن سعيد" :
        "https://www.youtube.com/@Ahmed_Said/videos",
    "دكتور بيرج بالعربي" :
        "https://www.youtube.com/@DrBergArabic/videos",
    "Towards Eternity"      : "https://www.youtube.com/@TowardsEternity/videos",
    "Lonewolf 902"         : "https://www.youtube.com/@Lonewolfwildcamping/videos",

    "Mustapha Swinga"      : "https://www.youtube.com/@Mustaphaswingaofficiel/videos",
    "Aji-Tfham"            : "https://www.youtube.com/@AjiTfham/videos",
    "emad fawaz - عماد فواز" : "https://www.youtube.com/@emadfawaz/videos",
    "emad Fawaz أصل الحكاية" : "https://www.youtube.com/@emadFawaz55/videos",
    "وزارة الأوقاف و الشؤون الإسلامية": "https://www.youtube.com/@ministere.habous/videos",
    "Misaha | مساحة" :      "https://www.youtube.com/@misaha/videos"

    }

def process_channel( channel, link ):

    system( 'ytcc subscribe "' + channel + '" "' + link + '"')
    system( 'ytcc update' )

def subscribe():
    with cf.ThreadPoolExecutor() as ex:

        p_channels = { chan : ex.submit( process_channel, chan, yt_channels[ chan ] ) for chan in yt_channels }

        for p_result in cf.as_completed( p_channels.values() ):
            print( f'--- "{chan}" processing done.' )


def update_all():
    system( 'ytcc update' )

def open_by_channel():

    for c in yt_channels:
        system( 'ytccf.sh -w -u -p "' + c + '"' )

def open_channel_2():

    i, l = 1, list(yt_channels)
    for c in yt_channels:
        print(f"{ ' ' * ( len( str( len( yt_channels ) ) ) - len( str ( i ) ) ) }{i}. {c}" )
        i += 1

    chan = input(f"Choose your channel [1, {len(yt_channels)}]: ")
    if chan.isdigit() and int(chan) <= len(yt_channels):
        system( 'ytccf.sh -w -u -p "' + l[ int(chan) - 1 ] + '"' )
    else:
        print(f'Wrong input not in range [1, {len( yt_channels )}]')

def open_channel():
    # system( '''ytccf.sh -w -u -p "$(ytcc subscriptions -a name | awk '{$1=$1};1' | fzf +m)"''' )
    channels = ""
    for c in yt_channels:
        channels += c + "\n"

    system( '''ytccf.sh -w -u -p "$(echo \"{}\" | fzf +m)"'''.format(channels) )


def mark_all_watched():

    system( 'ytcc mark `ytcc ls`' )

#open_by_channel()
