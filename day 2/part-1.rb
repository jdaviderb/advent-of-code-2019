input = File.open('./input').read.split(',').map(&:to_i)

def opcode_operation(opcode, a, b)
  opcode == 1 ? a + b : a * b
end

def execute(index_initial_opcode, input)
  index_opcode = index_initial_opcode

  loop do
    opcode = input[index_opcode]

    break if opcode.nil? || opcode == 99

    a = input[input[index_opcode + 1]]
    b = input[input[index_opcode + 2]]
    input[input[index_opcode + 3]] = opcode_operation(opcode, a, b)
    index_opcode += 4
  end

  input[0]
end

# before running the program, replace position 1 with the value 12 and replace position 2 with the value 2.
input[1] = 12
input[2] = 2

# running
puts execute(0, input)