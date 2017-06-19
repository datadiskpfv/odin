module Enumerable
  def my_each
    ## self is the array passed into this method (in this case: a1)
    yield self
  end

  def my_each_with_index
    i = 0
    while i < self.length
      yield self[i], i
      i += 1
    end
  end

  def my_select
    i = 0
    arr = []
    while i < self.length
      if yield self[i]
        arr.push(self[i])
      end
      i += 1
    end
    arr
  end

  def my_all?
    i = 0
    while i < self.length
      puts "#{self[i]}"
      if !yield self[i]
        return false
      end
      i += 1
    end
    return true
  end

  def my_any?
    i = 0
    while i < self.length
      if yield self[i]
        return true
      end
      i += 1
    end
    return false
  end

  def my_none?
    i = 0
    while i < self.length
      puts "#{self[i]}"
      if !yield self[i]
        return true
      end
      i += 1
    end
    return false
  end

  def my_count
    self.length
  end

  def my_map
    arr = []
    i = 0
    while i < self.length
      arr.push((yield self[i]))
      i += 1
    end
    arr
  end

  def my_inject
    sum = 0;
    i = 0
    while i < self.length
      puts "#{self[i]}  #{sum}"
      sum = yield sum, self[i]
      i += 1
    end
    sum
  end
end

a1 = %w{ paul lorraine dominic jessica}

#a1.my_each do |x|
#  puts x
#end

#a1.my_each_with_index do |x, index|
#  puts "#{x} #{index}"
#end

#puts [1,2,3,4,5,6].my_select { |num| num.even? }

#puts a1.all? { |word| word.length >= 4 }

#puts a1.any? { |word| word.length >= 9 }

#puts a1.none? { |word| word.length >= 3 }

#puts a1.my_count

#puts a1.my_map { |word| word.upcase }

puts [1,2,3,4,5,6].my_inject { |sum, n| sum - n }
