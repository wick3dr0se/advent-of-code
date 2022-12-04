#!/bin/bash

n="${1:-1}"
cd "day$n"

[[ $2 == 'bash' ]]||{
  i=1
  for f in *.nim; do
    [[ -f $f ]]&&{
      printf 'Nim [Day %d, Part %d]: ' "$n" "$i"
      nim c --hints:off "$f"
      time ./"${f%.nim}"
      ((i++))
    }
  done
}

[[ $2 == 'nim' ]]||{
  for c in *.sh; do
    ((count++))
  done

  i=1
  for f in *.sh; do
    [[ -f $f ]]&&{
      if (( count == 1 )); then
        printf 'BASH [Day %d, Part 1 & 2]: ' "$n"
      else
        printf 'BASH [Day %d, Part %d]: ' "$n" "$i"
      fi
      time bash $f
      ((i++))
    }
  done
}
