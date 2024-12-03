def load_input
  input = []
  File.open('./input.txt').each { |row| input << row.split.map! {|v| v.to_i} }

  input
end

def is_report_safe(values, min_diff = 1, max_diff = 3)
  prev_diff = nil

  for i in 0..values.length - 2 do
    n1, n2 = values[i], values[i + 1]
    diff = n1 - n2

    return false if (diff).abs < min_diff || (diff).abs > max_diff || (diff > 0 && n2 > n1) || (diff < 0 && n2 < n1) || (!prev_diff.nil? && ((prev_diff > 0 && diff < 0) || (prev_diff < 0 && diff > 0)))
    prev_diff = diff
  end

  true
end

safe, dampened = 0, 0
load_input.each do |row|
  if is_report_safe(row)
    safe += 1
    next
  end

  for i in 1..row.length - 1
    dup_row = row.dup
    dup_row.delete_at(i)
    dampened += 1 if is_report_safe(dup_row)
  end
end

puts "safe = %d, dampened = %d, total = %d" % [safe, dampened, safe + dampened]
