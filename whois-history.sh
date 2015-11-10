#!/bin/bash
today=$(date +%Y-%m-%d)
echo $today
while IFS='' read -r line || [[ -n "$line" ]]
do
	echo "Fetching "$line
	mkdir -p domains/$line/$today
	#whois $line
	echo $(whois $line) >> domains/$line/$today/whois.txt
	sleep 2s
done < "list.txt"
git add -A
git commit -m "Update whois "$today
git push
