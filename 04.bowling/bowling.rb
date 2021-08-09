# frozen_string_literal: true

inputs = ARGV[0].split(',')

scores = inputs.map { |s| s == 'X' ? 10 : s.to_i }

flame_scores = []
FULL_PIN = 10
i = 0

while flame_scores.size < 10
  throw1 = scores[i]
  throw2 = scores[i + 1] if i + 1 < scores.size
  throw3 = scores[i + 2] if i + 2 < scores.size

  if throw1 == FULL_PIN # strike
    total = throw1 + throw2 + throw3
    flame_scores.push(total)
    i += 1
  elsif throw1 + throw2 == FULL_PIN # spare
    total = throw1 + throw2 + throw3
    flame_scores.push(total)
    i += 2
  else
    total = throw1 + throw2
    flame_scores.push(total)
    i += 2
  end
end

puts flame_scores.sum
