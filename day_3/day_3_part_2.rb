total = 0
enabled = true

File.readlines("input.txt").each do |line|
  line.scan(/mul\(\d+\,\d+\)|do\(\)|don't\(\)/).each do |match|
    if match == "do()"
      enabled = true
    elsif match == "don't()"
      enabled = false
    else
      l, r = match[4..].split(",").map(&:to_i)
      total += l * r if enabled
    end
  end
end

p total
