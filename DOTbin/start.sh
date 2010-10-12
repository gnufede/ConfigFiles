#!/bin/bash
sleep 12;
tilda &
/usr/lib/battery-status/battery-status --indicator &
sleep 2;
gtk-redshift -r -l 40:-3.5 &
dropbox start -i &
dbupdate -nud45s &
