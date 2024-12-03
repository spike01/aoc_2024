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

def within_range?(i) = (1..3).cover?(i.abs)

def same_sign?(arr) = arr.map { sign(_1) }.uniq.size <= 1

def safe?(arr) = arr.all? { within_range?(_1) } && same_sign?(arr)

File.readlines("input.txt").each do |line|
  parsed = line.split(" ")
    .map(&:to_i)

  combos = parsed.combination(parsed.size - 1)

  safe += 1 if combos.any? do |combo|
    prev = combo.shift
    diffs = combo.map do |i|
      ret = prev - i
      prev = i
      ret
    end
    safe?(diffs)
  end
end

p safe
