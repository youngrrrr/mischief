echo "begin ${0##*/}"
zero=0
while [ 1 = 1 ]; do
	isLoggedIn="$(rwho > zwrite_infinite.txt | grep $1 zwrite_infinite.txt > zwrite_infinite2.txt | cat zwrite_infinite2.txt | wc -l)"
	if [ "$isLoggedIn" -gt "$zero" ]; then
		while [ 1 = 1 ]; do
			zwrite -q -n $1 <<< $2 \n .
			sleep $3
		done
	fi
	echo "$1 is offline. Trying again..."
	sleep $3
done
