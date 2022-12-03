#!/bin/bash

declare -A priorities
for c in {a..z}; do
  ((i++))
  priorities[$c]="$i"
done

for c in {A..Z}; do
  ((i++))
  priorities[$c]="$i"
done

i=0
while read -r rucksack ; do
  rucksacks+=("$rucksack")

  inventory="${#rucksacks[$i]}"
  
  ((compartment=inventory/2))
  
  compartmentOne="${rucksacks[$i]:: $compartment}"
  compartmentTwo="${rucksacks[$i]: ${compartment}}"
  
  [[ $compartmentOne =~ [$compartmentTwo] ]]&&
    itemType="${BASH_REMATCH[0]}"
  
  priority="${priorities[$itemType]}"
  
  ((sum+=priority))
  
  ((i++))
done < ./puzzle.txt

# part 2
for (( i=0; i<${#rucksacks[@]}; i++ )); do
  (( i%3 == 0))&& groups+=,
  groups+=" ${rucksacks[$i]}"
done

IFS=,
for group in $groups; do
  IFS=' '
  read -r elfOne elfTwo elfThree <<< "$group"

  i=0
  while (( i < ${#elfOne} )); do
    c=${elfOne:$i:1}
    if [[ $elfTwo =~ $c && $elfThree =~ $c ]]; then
      badge="${BASH_REMATCH[0]}"
    fi
    ((i++))
  done

  badgePriority="${priorities[${badge:-0}]}"

  ((sumTwo+=badgePriority))
done

printf '[Part %s]: \e[32m%s\e[m\n' \
  'one' "$sum" 'two' "$sumTwo"