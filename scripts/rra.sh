#/bin/sh

sed "s/RRA.*'/$1'/" jd_live_redrain.js > rain.js

n=$2
for i in $(seq $n); do
	echo $i
	source spnode rain.js
	wait
done

wait
rm rain.js
exit 0
