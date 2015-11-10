#!/bin/bash
cd ~/whois-history
echo "Pulling git..."
git pull
today=$(date +%Y-%m-%d)
while IFS='' read -r line || [[ -n "$line" ]]
do
	echo "Fetching "$line
	mkdir -p domains/$line/$today
	#whois $line
	echo $(whois $line) >> domains/$line/$today/whois.txt
	sleep 2s
done < "list.txt"
echo "Pushing git..."
git add -A
git commit -m "Update whois "$today
git push
