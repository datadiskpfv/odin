def test
  %w{ paul lorraine dominic jessica}.inject(Hash.new(0)) { |hash, key|
    #puts key
    hash[key] += 1
    hash
  }
end

p test