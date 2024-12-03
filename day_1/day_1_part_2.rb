lefts = []
rights = []

File.readlines("input.txt").each do |line|
  left, right = line.split("   ")
  lefts.push(left.to_i)
  rights.push(right.to_i)
end

left_tally = lefts.sort.tally
right_tally = rights.sort.tally

score = 0

left_tally.each do |num, tally|
  if right_tally[num]
    score += num * right_tally[num] * tally
  end
end

p score
