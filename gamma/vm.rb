require_relative 'compiler'

class VM
  def execute(bytecode)
    ip = 0
    stack = []
    locals = {}

    loop do
      instruction = bytecode[ip]
      ip += 1

      case instruction.opcode
      when :push
        stack.push(instruction.operands[0])

      when :get_local
        name = instruction.operands[0]
        val = locals[name] or raise "undefined variable #{name}"
        stack.push(val)

      when :set_local
        name = instruction.operands[0]
        locals[name] = stack.pop

      when :eq
        right = stack.pop
        left = stack.pop
        stack.push(left == right)

      when :not_eq
        right = stack.pop
        left = stack.pop
        stack.push(left != right)

      when :and
        right = stack.pop
        left = stack.pop
        stack.push(left && right)

      when :or
        right = stack.pop
        left = stack.pop
        stack.push(left || right)

      when :not
        val = stack.pop
        stack.push(! val)

      when :lt
        right = stack.pop
        left = stack.pop
        stack.push(left < right)

      when :lte
        right = stack.pop
        left = stack.pop
        stack.push(left <= right)

      when :gt
        right = stack.pop
        left = stack.pop
        stack.push(left > right)

      when :gte
        right = stack.pop
        left = stack.pop
        stack.push(left >= right)

      when :add
        right = stack.pop
        left = stack.pop
        stack.push(left + right)

      when :sub
        right = stack.pop
        left = stack.pop
        stack.push(left - right)

      when :mul
        right = stack.pop
        left = stack.pop
        stack.push(left * right)

      when :div
        right = stack.pop
        left = stack.pop
        stack.push(left / right)

      when :creljump
        condition = stack.pop

        if condition == false
          ip += instruction.operands[1]
        else
          ip += instruction.operands[0]
        end

      when :reljump
        ip += instruction.operands[0]

      when :call
        name = instruction.operands[0]

        args = []
        arg_count = stack.pop
        arg_count.times { args << stack.pop }

        if name == "print"
          puts args[0]
        else
          raise "unknown function "#{name}"
        end

      when :end
        break

      else
        raise "unknown opcode '#{instruction.opcode}' (#{instruction.inspect})"
      end
    end
  end
end

VM.new.execute(Compiler.new.compile(File.read(ARGV[0])))
