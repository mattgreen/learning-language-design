require_relative 'parser'

class Interpreter
  def initialize
    @globals = {}
    @frames = []
    @functions = {}
  end

  def evaluate(code)
    ast = Parser.new.parse(code)

    ast.nodes.each { |n| evaluate_node(n) }
  end

  private

  def evaluate_node(node)
    raise "non-node type passed to evaluate_node: #{node.inspect}" if node.class.name !~ /Node/

    #p node
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

  def evaluate_eq(node)
    evaluate_node(node.left) == evaluate_node(node.right)
  end

  def evaluate_not_eq(node)
    evaluate_node(node.left) != evaluate_node(node.right)
  end

  def evaluate_call(node)
    args = node.args.map { |a| evaluate_node(a) }

    if node.name == "print"
      puts args[0]
    elsif fn = @functions[node.name]
      raise "bad arity, expected #{fn.args.size} args, got #{args.size}" if args.size != fn.args.size

      @frames.push({})
      fn.args.zip(node.args) { |name, arg| locals[name] = evaluate_node(arg) }
      fn.body.each { |n| evaluate_node(n) }
      @frames.pop

    else
      raise "unknown function: #{node.name}"
    end
  end

  def evaluate_get_local(node)
    locals[node.name] || @globals[node.name] or raise "undefined variable '#{node.name}'"
  end

  def evaluate_set_local(node)
    locals[node.name] = evaluate_node(node.value)
  end

  def evaluate_if(node)
    if evaluate_node(node.condition) == false
      node.else_block.each { |n| evaluate_node(n) }
    else
      node.if_block.each { |n| evaluate_node(n) }
    end
  end

  def evaluate_def(node)
    @functions[node.name] = Function.new(node.name, node.args, node.body)
  end

  def locals
    return @globals if @frames.empty?

    @frames.last
  end
end

class Function < Struct.new(:name, :args, :body)
end

if __FILE__ == $0
  Interpreter.new.evaluate(File.read(ARGV[0]))
end
