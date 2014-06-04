# Dirt-simple lexer that parses statements of the form:
# print "<str>"
class Lexer
  def lex(code)
    tokens = []

    i = 0
    line = 1

    while i < code.length
      chunk = code[i..code.length]

      if print_statement = chunk[/\Aprint \"(.*)\"/]
        tokens << [:PRINT, $1]
        i += print_statement.length

      elsif comment = chunk[/\A#.*/]
        i += chunk.index("\n") || comment.length

      elsif chunk[0] == "\n"
        line += 1
        i += 1

      else
        raise "Syntax error on line #{line}: \"#{chunk[0..chunk.index("\n")-1]}\""

      end
    end

    tokens
  end
end

# An AST with only one node :)
class PrintNode < Struct.new(:str)
end

# Converts token stream produced by lexer into AST nodes
class Parser
  def initialize
    @lexer = Lexer.new
  end

  def parse(code)
    nodes = []

    tokens = @lexer.lex(code)
    tokens.each do |token|
      if token[0] == :PRINT
        nodes << PrintNode.new(token[1])
      else
        raise "Unexpected token: #{token}"
      end
    end

    nodes
  end
end

# Walks the specified AST, executing it
class Interpreter
  def evaluate(code)
    nodes = Parser.new.parse(code)

    nodes.each do |node|
      method = "evaluate" + node.class.name.gsub(/([A-Z])/) { "_#{$1.downcase}" }

      __send__(method, node)
    end
  end

  def evaluate_print_node(node)
    print node.str + "\n"
  end
end

# Simple bytecode format used by the compiler and the VM
#
# Opcode        Operands        Stack before    Stack after
# ---------------------------------------------------------
PUSH_STR = 0  # String to push  []              [str]
PRINT = 1     #                 [str]           []
RETURN = 2    #

class Compiler
  def initialize
    @bytecode = []
  end

  def compile(code)
    nodes = Parser.new.parse(code)

    nodes.each do |node|
      method = "compile" + node.class.name.gsub(/([A-Z])/) { "_#{$1.downcase}" }

      __send__(method, node)
    end

    emit(RETURN)

    @bytecode
  end

  def compile_print_node(node)
    emit(PUSH_STR, node.str)
    emit(PRINT)
  end

  def emit(opcode, *operands)
    @bytecode << opcode
    @bytecode.concat(operands)
  end
end

class VM
  def execute(bytecode)
    ip = 0
    stack = []

    loop do
      opcode = bytecode[ip]
      ip += 1

      case opcode
      when PUSH_STR
        stack.push(bytecode[ip])
        ip += 1

      when PRINT
        s = stack.pop

        print s + "\n"

      when RETURN
        break

      else
        raise "Unexpected opcode #{opcode}"

      end
    end
  end
end

code = File.read(ARGV[0])
#Interpreter.new.evaluate(File.read(ARGV[0]))
VM.new.execute(Compiler.new.compile(code))
