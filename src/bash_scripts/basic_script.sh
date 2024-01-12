#!/opt/homebrew/bin/bash

# Declare a variable first_arg to be your input argument
first_arg=$1

# Print your first ever variable
# echo "Your first variable is $first_arg"

# # Demo if-else: condition will be specified inside [[, ]], but for number use. (( ))
# if [[ $first_arg > 0 ]]; then
#   echo "First argument is positive"
# elif [[ $first_arg == 0 ]]; then
#   echo "First argument is zero"
# else
#   echo "First argument is negative"
# fi

# # Print all numbers from 0 to first_arg-1
# echo "All numbers from 0 to first_arg-1:"
# for ((i=0; i < $first_arg; i++)); do
#     echo $i
# done

## Function
mcd () {
    mkdir -p "$1"
    echo "Successfully create $1 folder"
}

# function example
# filepath="./data/data1.csv"
# my_readfile_func() {
#     while read -r line; do
#         # Use Internal Field Separator (IFS) to split string,
#         # then read the raw input (-r) and create a new array (-a) my_record
#         IFS=',' read -ra my_record <<< "$line"
#         echo ${my_record[-1]} # print the last element in my_record array
#         # echo ${my_record[${#my_record[@]}-1]}
#     done < $1 # the first argument that we pass to the my_readfile_func $1 = $filepath
# }
# my_readfile_func $filepath

# # Foor loop to look up .sh files
# echo "All the .sh files in the current directory:"
# for i in ./*.sh; do
#     echo $i
# done

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

# # Replace string 
# my_path="/home/quandv/Documents/home/m1/linux/scripts"
# echo "Replaced the first 'home': ${my_path/home/house}"
# # Split
# echo "Split my_path by / into an array:"
# IFS="/" read -ra my_array <<< "$my_path" && echo ${my_array[-1]}
# # echo "Delete everything up to the last slash: ${my_path##*/}" # delete everything till the last back slash
# # #: start from tail, ##: start from head
# # echo "Delete everything up to the last slash: ${my_path##*/m1}" # return /linux/scripts
# echo "Lower case: ${my_path,,}; Upper case: ${my_path^^}"
# my_array=(10 2 300)
# echo "First element: ${my_array[0]}"
# echo "Last element: ${my_array[-1]}"
# echo "Number of elements: ${#my_array[@]}"

# cat << EOF >> ./data/test.txt # change << EOF >> to < EOF> will be overwrite
# machine learning engineering
# data engineering
# EOF

# echo "data science" >> ./data/test.txt # >> append
# echo "math" > ./data/test.txt # > overwrite