import tables
# Advent of Code day 2, part 2: Rock Paper Scissors

# A|X = 1  rock
# B|Y = 2  paper
# C|Z = 3  scissors

# loss = X-Z
# tie = 3 + X-Z
# win = 6 + X-Z

# X-Z has to change shape to accommodate loss/tie/win

var rps: Table[string, int]

rps["B X"] = 1 # loss + rock
rps["C X"] = 2 # loss + paper
rps["A X"] = 3 # loss + scissors

rps["A Y"] = 4 # tie + rock
rps["B Y"] = 5 # tie + paper
rps["C Y"] = 6 # tie + scissors

rps["C Z"] = 7 # win + rock
rps["A Z"] = 8 # win + paper
rps["B Z"] = 9 # win + scissors

var sum = 0
for match in "puzzle.txt".lines:
  sum += rps[match]
echo sum
