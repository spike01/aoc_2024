total = 0

File.readlines("input.txt").each do |line|
  line.scan(/mul\(\d+\,\d+\)/).each do |match|
    l, r = match[4..].split(",").map(&:to_i)
    total += l * r
  end
end

p total
