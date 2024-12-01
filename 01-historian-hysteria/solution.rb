def load_input
  in_1 = []
  in_2 = []

  File.open('./input.txt').each do |row|
    a, b = row.split
    in_1 << a.to_i
    in_2 << b.to_i
  end

  in_1.sort!
  in_2.sort!
  
  return in_1, in_2
end

def total_distance(in_1, in_2)
  dist = 0
  in_1.each_with_index {|v, i| dist += (v - in_2[i]).abs}

  dist
end

def similarity_score(in_1, in_2)
  in_2_tally = in_2.tally
  score = 0

  in_1.each {|v| score += in_2_tally[v].nil? ? 0 : v * in_2_tally[v]}

  score
end

in_1, in_2 = load_input
print total_distance(in_1, in_2)
print "\n"
print similarity_score(in_1, in_2)
