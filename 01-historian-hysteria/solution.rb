def load_input
  in_1, in_2 = [], []

  File.open('./input.txt').each do |row|
    a, b = row.split
    in_1 << a.to_i
    in_2 << b.to_i
  end

  [in_1.sort!, in_2.sort!]
end

def total_distance(in_1, in_2)
  in_1.each_with_index.map {|v, i| (v - in_2[i]).abs}.sum()
end

def similarity_score(in_1, in_2)
  in_2_tally, score = in_2.tally, 0
  in_1.each.map {|v| in_2_tally[v].nil? ? 0 : v * in_2_tally[v]}.sum()
end

in_1, in_2 = load_input
puts 'total_distance = %d, similarity_score = %d' % [total_distance(in_1, in_2), similarity_score(in_1, in_2)]
