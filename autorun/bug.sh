#!/bin/bash

c=1

while [ $c > 0 ]

do

  max=1440

 for counter in `seq 1 $max`

  do

    timeout  arecord -vv bugs$counter


HOST="your_host"
USER="your_username"
PASSWD="your_password"
FILE="bugs$counter"


ftp -n $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
passive
put $FILE $HOST/$FILE.wav
quit
END_SCRIPT

 find -type f -name '*bugs*' -delete

 done

 exit 1

done

