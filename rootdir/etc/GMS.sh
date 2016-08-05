#!/system/bin/sh
# By USBhost

sleep 60; # give some time for boot


# This will check if com.google.android.gms.persistent went rogue.
# if com.google.android.gms.persistent is the first entry in top then its
# considered to be rogue. (If com.google.android.gms.persistent goes
# rogue it will kill sleep and use ~90% of cpu)
while true;
do 
	# This may be an issue if its gets to the top and its not rogue. this may happen.
	# If anyone knows how to check the cpu % of an runing process let me know.
	bad="$(top -m 1 -n 1 | grep -o com.google.android.gms.persistent)";
	if [ "$bad" == "com.google.android.gms.persistent" ]; then
		pid="$(pidof com.google.android.gms.persistent)";
		kill $pid;
	else
		sleep 10;
	fi
done
