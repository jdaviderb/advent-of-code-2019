input = File.open('./input').read.split.map(&:to_i)

def calculate_fuel(mass)
  mass / 3 - 2
end

puts input.sum { |mass| calculate_fuel(mass) }
