require_relative 'compiler'

class VM
  def execute(bytecode)
    ip = 0
    stack = []
    locals = {}

    loop do
      opcode = bytecode[ip]
      ip += 1

      case opcode
      when :push
        stack.push(bytecode[ip])
        ip += 1

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

      when :call
        arg = stack.pop
        name = bytecode[ip]
        ip += 1

        if name == "print"
          puts arg
        else
          raise "unknown function: #{name}"
        end

      when :get_local
        name = bytecode[ip]
        ip += 1
        val = locals[name] or raise "undefined variable '#{name}'"

        stack.push(val)

      when :set_local
        name = bytecode[ip]
        ip += 1

        locals[name] = stack.pop

      when :return
        break

      else
        raise "unexpected opcode: #{opcode}"
      end
    end

  end
end

VM.new.execute(Compiler.new.compile(File.read(ARGV[0])))
