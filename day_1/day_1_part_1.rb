lefts = []
rights = []
diffs = []

File.readlines("input.txt").each do |line|
  left, right = line.split("   ")
  lefts.push(left.to_i)
  rights.push(right.to_i)
end

lefts.sort!
rights.sort!

lefts.each.with_index do |i, idx|
  diffs.push((i - rights[idx]).abs)
end

p diffs.sum
