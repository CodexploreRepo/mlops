#!/opt/homebrew/bin/bash

# Declare a variable first_arg to be your input argument
first_arg=$1

# echo "Running program $0 with $# arguments with pid $$"
# # Print your first ever variable
# echo "Your first variable is $first_arg"

# # Demo if-else: condition will be specified inside [[, ]], but for number use. (( ))
# if [[ $first_arg > 0 ]]; then
#   echo "First argument is positive"
# elif [[ $first_arg == 0 ]]; then
#   echo "First argument is zero"
# else
#   echo "First argument is negative"
# fi


# # Positive and negative number
# if (( $first_arg > 0 )); then
#     echo "Positive number"
# else
#     echo "Non-positive number"
# fi

# # Don't use [[ 10 > 9 ]], but use 
# # (( 10 > 9 )) for numerical operations
# if [[ 10 > 9 ]]; then
#   echo "10 > 9 is true"
# else
#   echo "10 > 9 is false"
# fi

# # While-loop
# i=1
# while [[ $i -le 5 ]]
# do
#     echo "$i"
#     ((i+=1))
# done

# # For-loop

# Print all numbers from 0 to first_arg-1
echo "All numbers from 0 to $first_arg-1:"
for ((i=0 ; i < $first_arg ; i++))
do
    echo $i
done

# # Foor loop to look up .sh files
# echo "All the .sh files in the current directory:"
# for i in ./*.sh; do
#     echo $i
# done

## Function
# mcd () {
#     mkdir -p "$1"
#     echo "Successfully create $1 folder"
# }

# file_path="./data/input.txt"

# read_txt() {
#     while read line
#     do 
#         echo "$line"
#     done < $1
# }
# read_txt $file_path

# # Read csv example
# file_path="./data/data1.csv"
# my_readfile_func() {
#     while read -r line; do
#         # Use Internal Field Separator (IFS) to split string,
#         # then read the raw input (-r) and create a new array (-a) my_record
#         IFS=',' read -ra my_record <<< "$line"
#         echo ${my_record[-1]} # print the last element in my_record array
#         # echo ${my_record[${#my_record[@]}-1]}
#     done < $1 # the first argument that we pass to the my_readfile_func $1 = $filepath
# }
# my_readfile_func $file_path

# # Replace string 
# original_string="Hello Hello, world!"
# replacement="Goodbye"
# result_string="${original_string/Hello/$replacement}"
# echo "$result_string" # Goodbye Hello, world!

# original_string="Hello, world! Hello, world!"
# result_string="${original_string//world/$replacement}"
# echo "$result_string" # Hello, Goodbye! Hello, Goodbye!


my_path="/home/quandv/Documents/home/m1/linux/scripts"
# echo "Replaced the first 'home': ${my_path/home/house}" # replace "home" with "house"
# # Split
# echo "Split $my_path by / into an array:"
# IFS="/" read -ra my_array <<< "$my_path"
# for element in ${my_array[@]}
# do
#     echo "'$element'"
# done
# echo "Delete everything up to the last slash: ${my_path##*/}" # delete everything till the last back slash

# echo "Delete everything up to the /linux/scripts: ${my_path##*/m1}" # return /linux/scripts
# echo "Lower case: ${my_path,,}; Upper case: ${my_path^^}"
# # array direct assignment
# my_array=(10 2 300)
# echo "First element: ${my_array[0]}"
# echo "Last element: ${my_array[-1]}"
# echo "Number of elements: ${#my_array[@]}"

cat << EOF >> ./data/test.txt # change << EOF >> to < EOF> will be overwrite
machine learning engineering
data engineering
EOF

echo "data science" >> ./data/test.txt # >> append
echo "math" > ./data/test.txt # > overwrite