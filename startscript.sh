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

### Version >= 2.5.0 || Version >= 21.02
/usr/sbin/gpioctl -f /dev/gpioc2 2 duty 0

### Version <= 2.4.5
# gpioctl 2 duty 0
