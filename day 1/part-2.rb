input = File.open('./input').read.split.map(&:to_i)

def calculate_fuel(mass)
  fuel = (mass / 3 - 2).round

  return 0 if fuel.negative?

  fuel
end

def calculate_extra_fuel(fuel)
  new_fuel, total_new_fuel = nil,0

  calculate = lambda do
    new_fuel = calculate_fuel(new_fuel || fuel)
    total_new_fuel += new_fuel
    new_fuel
  end

  return fuel if calculate.call.zero?
  calculate.call while new_fuel.positive?

  fuel + total_new_fuel
end

puts input.sum { |mass| calculate_extra_fuel(calculate_fuel(mass)) }
