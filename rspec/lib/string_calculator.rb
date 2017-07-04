class StringCalculator

  def self.add(input)
    if input.empty?
     0
    else
      numbers = input.split(',').map { |num| num.to_i}
      numbers.inject(0) {|sum, number| puts "SUM: #{sum} NUM: #{number}"; sum + number}
    end
  end
end