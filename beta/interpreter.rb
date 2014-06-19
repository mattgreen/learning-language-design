require_relative 'parser'

class Interpreter
  def evaluate(code)
    ast = Parser.new.parse(code)

    ast.nodes.each { |n| evaluate_node(n) }
  end

  private

  def evaluate_node(node)
    if node.is_a?(LiteralNode)
      return node.value
    end

    m = "evaluate" + node.class.name.gsub(/([A-Z])/) { "_#{$1.downcase}" }.gsub("_node", "")
    __send__(m, node)
  end

  def evaluate_add(node)
    p evaluate_node(node.left) + evaluate_node(node.right)
  end

  def evaluate_sub(node)
    p evaluate_node(node.left) - evaluate_node(node.right)
  end

  def evaluate_mul(node)
    p evaluate_node(node.left) * evaluate_node(node.right)
  end

  def evaluate_div(node)
    p evaluate_node(node.left) / evaluate_node(node.right)
  end
end

if __FILE__ == $0
  Interpreter.new.evaluate(File.read(ARGV[0]))
end
