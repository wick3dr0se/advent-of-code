import tables
# Advent of Code day 2, part 1: Rock Paper Scissors

# A|X = 1  rock
# B|Y = 2  paper
# C|Z = 3  scissors

# loss = X-Z
# tie = 3 + X-Z
# win = 6 + X-Z

var rps: Table[string, int]

rps["B X"] = 1 # loss + rock
rps["C Y"] = 2 # loss + paper
rps["A Z"] = 3 # loss + scissors

rps["A X"] = 4 # tie + rock
rps["B Y"] = 5 # tie + paper
rps["C Z"] = 6 # tie + scissors

rps["C X"] = 7 # win + rock
rps["A Y"] = 8 # win + paper
rps["B Z"] = 9 # win + scissors

var sum = 0
for match in "puzzle.txt".lines:
  sum += rps[match]
echo sum
