#!/bin/bash
# shellcheck disable=SC2004

get_sum(){
declare -gi cals
IFS=' '
for _ in ${cal[$1]}; do
  cals[$1]+="$_"
done
}

get_cal_max(){
  local c index
  (( $1 == 0 ))|| ((index=$1-1))
  (( $1 == 2 ))&& cals=("${cals[@]/${elfCalsMax[0]}}")
  for c in "${cals[@]/${elfCalsMax[$index]}}" ; do
    (( c > ${elfCalsMax[$1]:=0} ))&& elfCalsMax[$1]="$c"
  done
}


# read file into a comma seperated string
while read -r line ; do
  if [[ $line == '' ]]; then
    lines+=,
  else
    lines+="$line "
  fi
done < elfCalories.txt

IFS=, # split on comma
# store each line to an iterated indexed array
for _ in $lines ; do
  cal[$i]+="$_"
  ((++i))
done

# for each calorie (array) index, get the total sum
for ((i=0; i<${#cal[@]}; i++)); do
  get_sum "$i"
done

# get the most elf calories
get_cal_max 0
printf '[Part one]: \e[32m%s\e[m\n' "${elfCalsMax[0]}"

# get next 2 top elf calories; get the sum of all 3
get_cal_max 1; get_cal_max 2
declare -i elvesCalsMax
for _ in "${elfCalsMax[0]}" "${elfCalsMax[1]}" "${elfCalsMax[2]}" ; do
  elvesCalsMax+="$_"
done
printf '[Part two]: \e[32m%s\e[m\n' "$elvesCalsMax"
