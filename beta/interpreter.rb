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
    evaluate_node(node.left) + evaluate_node(node.right)
  end

  def evaluate_sub(node)
    evaluate_node(node.left) - evaluate_node(node.right)
  end

  def evaluate_mul(node)
    evaluate_node(node.left) * evaluate_node(node.right)
  end

  def evaluate_div(node)
    evaluate_node(node.left) / evaluate_node(node.right)
  end

  def evaluate_call(node)
    if node.name == "print"
      puts evaluate_node(node.args[0])
    else
      raise "unknown function: #{node.name}"
    end
  end
end

if __FILE__ == $0
  Interpreter.new.evaluate(File.read(ARGV[0]))
end
