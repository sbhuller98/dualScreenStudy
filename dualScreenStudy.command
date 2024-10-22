#!/usr/bin/env python
 
import os
from subprocess import call, Popen, PIPE
import time


#keeps mac awake, amphetamine automatically starts with an indefinite session
os.system("open /Applications/Amphetamine.app")

#launch vs code first as it takes a while to run and initialize
os.system("open /Applications/'Visual Studio Code'.app")

#set volume for spotify
call(["osascript -e 'set volume output volume 40'"], shell=True)

#turn on do not disturb
script_turn_on_dnd = ' tell application "System Events" to keystroke "D" using {command down, shift down, option down, control down}'
popen_script_dnd = Popen(['osascript', '-'], stdin=PIPE, stdout=PIPE, stderr=PIPE, universal_newlines=True)
stdout, stderr = popen_script_dnd.communicate(script_turn_on_dnd)

#saving applescript for launching safari and spotify in full screen
script_open_full = '''set MyApps to {"Safari", "Spotify"}
repeat with MyApp in MyApps
    tell application MyApp
        activate
        delay 3
    end tell
    tell application "System Events"
        tell process MyApp
            set value of attribute "AXFullScreen" of window 1 to true
            delay 1
        end tell
    end tell
end repeat'''

#launches safari and spotify in full screen
popen_script_full_screen = Popen(['osascript', '-'], stdin=PIPE, stdout=PIPE, stderr=PIPE, universal_newlines=True)
stdout, stderr = popen_script_full_screen.communicate(script_open_full)

#script for launching social apps whatsapp, discord, and messages in a new desktop
script_newDesktop_messaging = '''tell application "System Events"
    tell application "Mission Control" to launch
    tell group 2 of group 1 of group 1 of process "Dock"
        click (every button whose value of attribute "AXDescription" is "add desktop")
        tell list 1
            set countSpaces to count of buttons
            delay 0.5
            click button (countSpaces)
        end tell
    end tell

    delay 0.5
    tell application "Messages" to launch
    tell application "WhatsApp" to launch
    tell application "Discord" to launch
end tell'''

#launches whatsapp, discord, and messages apps in new desktop
popen_script_messaging = Popen(['osascript', '-'], stdin=PIPE, stdout=PIPE, stderr=PIPE, universal_newlines=True)
stdout, stderr = popen_script_messaging.communicate(script_newDesktop_messaging)


