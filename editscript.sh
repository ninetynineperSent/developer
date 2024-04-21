
#!/bin/bash

filename="logs.txt" # название файла

# считаем кол-во строчек в файле
count=$(sed -n \$= $filename)

# создвем массивы для всех хэшей и для всех файлов
all_names=()
all_hashs=()

# перебираем каждую строчку
for ((i = 1; i <= count; i++)) 
do
    echo $i
    # храним в temp строку под номером i
    temp=$(sed -n "$i p" $filename)
    echo "$temp"

    # разделяем строку на элементы через пробелы и записываем в массив
    IFS=' ' read -r -a array <<< "$temp"

    # записывем имя и хэш файла в соответсвующий массив
    all_names+=(${array[6]})
    all_hashs+=(${array[9]})
    
    # делаем проверку
    echo "это хэш $i строки: "${array[9]}
    echo "это имя файла $i строки: "${array[6]}
done

# создаем новые массивы
new_all_names=()
new_all_hashs=()

# удаляем одинакеовые элементы из массивов

unset dupes 
declare -A dupes

for i in "${all_names[@]}"; do
    if [[ -z ${dupes[$i]} ]]; then
        new_all_names+=("$i")
    fi
    dupes["$i"]=1
done

for i in "${all_hashs[@]}"; do
    if [[ -z ${dupes[$i]} ]]; then
        new_all_hashs+=("$i")
    fi
    dupes["$i"]=1
done
unset dupes 


echo "количество уникальных имен файлов: "${#new_all_names[@]}
echo "количество уникальных hash файлов: "${#new_all_hashs[@]}

echo "количество внесенных изменений: "$count


# echo ${#a[@]}







