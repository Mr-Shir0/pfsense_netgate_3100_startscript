#!/bin/sh

### BEGIN INIT INFO
# Provides:		startscript
# Required-Start:	$local_fs $network
# Required-Stop:	$local_fs $network
# Default-Start:	2 3 4 5
# Default-Stop:		0 1 6
# Description:		Script execute on startup
### END INIT INFO

# Where to place: "/usr/local/etc/rc.d/startscript.sh"

# Turn off the blue flashing LED
sleep 30

# Get current pfSense Version
ver = "pkg search pfSense | grep Meta | grep -v builder | cut -f 1 -d ' ' | cut -f 2 -d '-' | tr -d '.'"

if [ "$ver" -ge "2102" ] || [ "$ver" -ge "250" ] then
  # Version >= 2.5.0 || Version >= 21.02
  /usr/sbin/gpioctl -f /dev/gpioc2 2 duty 0

else
  # Version <= 2.4.5
  gpioctl 2 duty 0

fi
