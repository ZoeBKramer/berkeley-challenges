def collatz_sequence(n)

collatz = [n]

  i = n 

  while i > 1 do
    if i % 2 == 0 
      i = i / 2
    elsif i % 2 == 1
      i = 3 * i + 1 
    end 

    collatz.push(i)
  end

  return collatz
end

def find_longest_s

  i = 1
  highest_num = 1
  collatz_num = 1

  while i < 1000000 do
    current_s = collatz_sequence(i)
    if current_s.length > highest_num
      highest_num = current_s.length 
      collatz_num = i 
    end
    i+=1
  end

  return collatz_num
end

puts find_longest_s
