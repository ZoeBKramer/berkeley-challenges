module Luhn
  def self.is_valid?(number)
    nums = number.to_s.split("")  
    nums.reverse!
    digits = []

    for i in (0...nums.length) do 
      inum = nums[i].to_i
      if i % 2 == 1
        if (inum * 2 >= 10)
          digits.push((inum * 2) - 9)
        else 
          digits.push(inum * 2)
        end
      else
        digits.push(inum)
      end
    end 

    sum = 0

    for i in digits do
      sum = sum + i
    end
    if (sum % 10) == 0
      return true
    else
      return false
    end
  end
end