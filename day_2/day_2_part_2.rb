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

def within_range?(i) = 1 <= i.abs && i.abs < 4

def same_sign?(arr) = arr.map { sign(_1) }.uniq.size <= 1

def safe?(arr) = arr.all? { within_range?(_1) } && same_sign?(arr)

File.readlines("input.txt").each do |line|
  parsed = line.split(" ")
    .map(&:to_i)

  prev = parsed.shift
  diffs = parsed.map do |i|
    ret = prev - i
    prev = i
    ret
  end

  if safe?(diffs)
    safe += 1
  end
end

p safe
