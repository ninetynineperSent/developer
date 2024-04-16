
#!/bin/bash

read -p "enter filename: " filename
read -p "which string we're going to replace? " old_string
read -p "enter string, which will be pasteded: " new_string


#sed -i "1,+5 s|$old_string|$new_string|g" ~/mybash/history_of_vim.txt
sed -i "s|$old_string|$new_string|g" ~/mybash/$filename


date_result=$(date +"%d.%m.%Y %H:%M:%S")
sha=$(sha256sum $filename) 

temp=( $sha )
sha=${temp[0]}

echo "| date: $date_result | filename: $filename | hash: $sha | algoritm: sha256 |" >> logs.txt

#echo "$date_result"

#echo "$ans" >> test.txt

