safe = 0

def sign(i)
  if i.zero?
    :zero
  elsif i.positive?
    :+
  else
    :-
  end
end

File.readlines("input.txt").each do |line|
  parsed = line.split(" ")
    .map(&:to_i)

  prev = 0
  diffs = parsed.map do |i| 
    ret = prev - i
    prev = i
    ret
  end

  if diffs.drop(1).all? { |diff| 1 <= diff.abs && diff.abs < 4 } &&
     diffs.drop(1).map { |diff| sign(diff) }.uniq.size <= 1
    safe +=1 
  end
end

p safe

