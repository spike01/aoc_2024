def sign(int)
  if int.zero?
    :zero
  elsif int.positive?
    :+
  else
    :-
  end
end

count = 0

File.readlines("input.txt").each do |line|
  parsed = line.split(" ")
    .map(&:to_i)

  diff = nil
  sign = sign(parsed.first)
  prev = parsed.first
  steps = 0
  skipped = 0

  parsed.each do |i|

    if steps == 0
      steps += 1
      next
    end

    diff = prev - i

    if !(1 <= diff.abs && diff.abs < 4 && sign == sign(i))
      skipped += 1
      next
    end

    sign = sign(i)
    prev = i
    steps += 1
  end

  if (steps == parsed.size || steps == parsed.size - 1) && skipped <= 1
    count += 1
  end
end

puts count
