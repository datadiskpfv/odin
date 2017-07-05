module Enumerable
  def my_each
    ## should do this for all but won't
    raise SyntaxError unless block_given?

    ## self is the array passed into this method (in this case: a1)
    yield self
  end

  def my_each_with_index
    self.each_with_index do |x, i|
      yield x, i
    end
  end

  def my_select
    arr = []
    self.each do |x|
      if yield x
        arr.push(x)
      end
    end
    arr
  end

  def my_all?
    self.each do |x|
      puts "#{x}"
      if !yield x
        return false
      end
    end
    return true
  end

  def my_any?
    self.each do |x|
      if yield x
        return true
      end
    end
    return false
  end

  def my_none?
    self.each do |x|
      puts "#{x}"
      if !yield x
        return true
      end
    end
    return false
  end

  def my_count
    self.length
  end

  def my_map
    arr = []
    self.each do |x|
      arr.push((yield x))
    end
    arr
  end


  def my_inject(sum = 0)
    self.each do |x|
      sum = yield sum, x
    end
    sum
  end

  def my_map_proc(p1)
    arr = []
    self.each do |x|
      arr.push(p1.call x)
    end
    arr
  end
end

#a1 = %w{ paul lorraine dominic jessica}

#pr1 = Proc.new { |word| word.upcase }
#puts a1.my_map_proc(pr1)

#puts a1.my_each { |x| x }

#a1.my_each_with_index do |x, index|
#  puts "#{x} #{index}"
#end

#puts [1,2,3,4,5,6].my_select { |num| num.even? }

#puts a1.all? { |word| word.length >= 4 }

#puts a1.any? { |word| word.length >= 9 }

#puts a1.none? { |word| word.length >= 3 }

#puts a1.my_count

#puts a1.my_map { |word| word.upcase }

#puts [1,2,3,4,5,6].my_inject(1) { |sum, n| sum * n }