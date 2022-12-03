#!/bin/bash

declare -A rps=( # rock paper scissors
  [A]=1 [B]=2 [C]=3 # opponent
  [X]=1 [Y]=2 [Z]=3 # ally
)
 
while read -r o a; do
  # convert to integer values
  ally="${rps[$a]}" opp="${rps[$o]}"

  case $ally in
    1) # ally X - rock
      a=0 # loss
      case $opp in
	1) # opp A - rock
	  ((a+=3)) # ally Z - scissors
	  ((ally+=3)) # tie
	;;
	2) # opp B - paper 
	  ((a++)) # ally X - rock
	;;
	3) # opp C - scissors
	  ((a+=2)) # ally Y - paper
	  ((ally+=6)) # win
	;;
      esac
    ;;
    2) # ally Y - paper
      a=3 # tie
      case $opp in
	1) # opp A - rock
	  ((a++)) # ally X - rock
	  ((ally+=6)) # win
	;;
	2) # opp B - paper
	  ((a+=2)) # ally Y - paper
	  ((ally+=3)) # tie
	;;
        3) # opp C - scissors
	  ((a+=3)) # ally Z - scissors
	;;
      esac
    ;;
    3) #ally Z - scissors 
      a=6 # win 
      case $opp in
	1) # opp A - rock
	  ((a+=2)) # ally Y - paper
	;;
	2) # opp B - paper
	  ((a+=3)) # ally Z - scissors
	  ((ally+=6)) # win
	;;
        3) # opp C - scissors
	  ((a++)) # ally X - rock
	  ((ally+=3)) # tie
	;;
      esac
    ;;
  esac

  # ally total part 1
  ((sum+=ally))
  # ally total part 2
  ((sumTwo+=a))
done < ./puzzle.txt

printf '[Part %s]: \e[32m%d\e[m\n' \
	'one' "$sum" 'two' "$sumTwo"
