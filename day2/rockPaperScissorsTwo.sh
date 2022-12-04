#!/bin/bash
# Advent of Code day 2, part 2: Rock Paper Scissors

# A|X = 1  rock
# B|Y = 2  paper
# C|Z = 3  scissors

# loss = X-Z
# tie = 3 + X-Z
# win = 6 + X-Z

# X-Z has to change shape to accommodate loss/tie/win

declare -A rps=(
 [X B]=1 [X C]=2 [X A]=3 # loss
 [Y A]=4 [Y B]=5 [Y C]=6 # tie
 [Z C]=7 [Z A]=8 [Z B]=9 # win
)
 
while read -r o a; do
  ((sum+="${rps[$a $o]}"))
done < ./puzzle.txt

echo "$sum"
