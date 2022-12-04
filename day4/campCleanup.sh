#!/bin/bash
# Advent of Code day 4, part 1&2: Camp Cleanup

# s1 = pair one
# s2 = pair two
# L is for low
# H is for high

IFS=,
while read p1 p2; do
  p1L="${p1%-*}" p1H="${p1#*-}"
  
  p2L="${p2%-*}" p2H="${p2#*-}"

  if (( p1L >= p2L && p1H <= p2H )); then
    ((++contain)) # within pair 2
  elif (( p2L >= p1L && p2H <= p1H )); then
    ((++contain)) # within pair 1
  elif (( p1H >= p2L && p1H <= p2H )); then
    ((++overlap)) # in pair 2
  elif (( p2H >= p1L && p2H <= p1H )); then
    ((++overlap)) # in pair 1
  fi
done < puzzle.txt

((overlap+=contain))

echo "$contain $overlap"
