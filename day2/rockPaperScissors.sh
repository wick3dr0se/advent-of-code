#!/bin/bash
# Advent of Code day 2, part 1&2: Rock Paper Scissors

# A|X = 1  rock
# B|Y = 2  paper
# C|Z = 3  scissors

# loss = X-Z
# tie = 3 + X-Z
# win = 6 + X-Z

declare -A rps=(
  [X B]=1 [Y C]=2 [Z A]=3 # loss
  [X A]=4 [Y B]=5 [Z C]=6 # tie
  [X C]=7 [Y A]=8 [Z B]=9 # win

# part 2
# X-Z has to change shape to accommodate loss/tie/win
  [B X]=1 [C X]=2 [A X]=3 # loss
  [A Y]=4 [B Y]=5 [C Y]=6 # tie
  [C Z]=7 [A Z]=8 [B Z]=9 # win
)

while read -r o a; do
  ((sum+="${rps[$a $o]}"))
  ((sumTwo+="${rps[$o $a]}"))
done < ./puzzle.txt

echo "$sum $sumTwo"


