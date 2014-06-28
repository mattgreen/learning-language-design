require_relative 'compiler'

class VM
  def execute(bytecode)
    ip = 0
    functions = {}
    stack = []
    frames = [{}]
    locals = frames.first
    return_ips = []

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

      when :fn_begin
        name = instruction.operands[0]
        functions[name] = ip

        while bytecode[ip].opcode != :fn_end
          ip += 1
        end

        ip += 1

      when :frame_setup
        return_ips.push(stack.pop)

        arg_names = instruction.operands[0].dup

        args = {}
        arg_count = stack.pop
        while ! arg_names.empty?
          arg_name = arg_names.pop
          args[arg_name] = stack.pop
        end

        frames.push(args)
        locals = frames.last

      when :frame_teardown
        frames.pop
        locals = frames.last

        ip = return_ips.pop

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

        if name == "print"
          args = []
          arg_count = stack.pop
          arg_count.times { args << stack.pop }

          puts args[0]
        elsif fn_ip = functions[name]
          stack.push(ip)
          ip = fn_ip
        else
          raise "unknown function '#{name}'"
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
