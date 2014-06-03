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
        i += chunk.index("\n")

      elsif chunk[0] == "\n"
        line += 1
        i += 1

      else
        raise "Unexpected input on line #{line}: \"#{chunk[0..chunk.index("\n")-1]}\""

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
    @nodes = []
  end

  def parse(tokens)
    nodes = []

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
  def evaluate(nodes)
    nodes.each do |node|
      method = "evaluate" + node.class.name.gsub(/([A-Z])/) { "_#{$1.downcase}" }

      __send__(method, node)
    end
  end

  def evaluate_print_node(node)
    print node.str + "\n"
  end
end

tokens = Lexer.new.lex(File.read(ARGV[0]))
nodes = Parser.new.parse(tokens)
Interpreter.new.evaluate(nodes)

