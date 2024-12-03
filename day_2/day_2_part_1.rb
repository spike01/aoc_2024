safe = 0

def direction(a, b)
  diff = b - a
  if diff.zero?
    0
  elsif diff.positive?
    1
  else
    -1
  end
end

File.readlines("input.txt").each do |line|
  parsed = line.split(" ")
    .map(&:to_i)

  direction = direction(parsed[0], parsed[1])
  is_safe = true

  parsed.each.with_index do |i, idx|
    next_item = parsed[idx + 1]
    break unless next_item 

    diff = (next_item - i).abs
    next_direction = direction(i, next_item)
    
    unless next_item && next_direction == direction && 1 <= diff && diff < 4
      is_safe = false
    end
    direction = next_direction
  end
  safe += 1 if is_safe
end

p safe

