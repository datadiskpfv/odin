def merge_sort(list)
  ## our base which is 1, split until we have one element
  #p list.size
  return list if list.size == 1

  ## keep splitting the list into left and right
  left,right = list.each_slice( (list.size/2.0).round ).to_a

  #p "LEFT: #{left}"
  #p "RIGHT: #{right}"

  ## now we have our left and right we need to compare
  merge(merge_sort(left),merge_sort(right))

end

def merge(left, right)
  p "LEFT (merge): #{left}"
  p "RIGHT (merge): #{right}"

  sorted = []
  until left.empty? || right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted.concat(left).concat(right)
  p sorted
end


orig_array = %w{ 5 7 4 8 2 3 1 6 9 15 10 11}.map(&:to_i)
p merge_sort(orig_array)