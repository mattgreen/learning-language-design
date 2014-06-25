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

      when :eq
        right = stack.pop
        left = stack.pop
        stack.push(left == right)

      when :not_eq
        right = stack.pop
        left = stack.pop
        stack.push(left != right)

      when :call
        arg = stack.pop
        name = instruction.operands[0]

        if name == "print"
          puts arg
        else
          raise "unknown function: #{name}"
        end

      when :get_local
        name = instruction.operands[0]
        val = locals[name] or raise "undefined variable '#{name}'"

        stack.push(val)

      when :set_local
        name = instruction.operands[0]

        locals[name] = stack.pop

      when :if
        true_jump = instruction.operands[0]
        false_jump = instruction.operands[1]

        condition = stack.pop
        if condition == false
          ip = false_jump
        else
          ip = true_jump
        end

      when :jump
        ip = instruction.operands[0]

      when :return
        break
      end
    end
  end
end

VM.new.execute(Compiler.new.compile(File.read(ARGV[0])))
