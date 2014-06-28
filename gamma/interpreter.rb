require_relative 'parser'

class Interpreter
  def initialize
    @globals = {}
    @frames = []
    @functions = {}
    @builtins = {}

    @returning = false
    @breaking = false

    @builtins["print"] = ->(args) { puts args[0] }
  end

  def evaluate(code)
    ast = Parser.new.parse(code)

    ast.nodes.each { |n| evaluate_node(n) }
  end

  private

  def evaluate_node(node)
    raise "non-node type passed to evaluate_node: #{node.inspect}" if node.class.name !~ /Node/

    if node.is_a?(LiteralNode)
      return node.value
    end

    m = "evaluate" + node.class.name.gsub(/([A-Z])/) { "_#{$1.downcase}" }.gsub("_node", "")
    __send__(m, node)
  end

  def evaluate_add(node)
    evaluate_binary_operand(node) { |l, r| l + r }
  end

  def evaluate_sub(node)
    evaluate_binary_operand(node) { |l, r| l - r }
  end

  def evaluate_mul(node)
    evaluate_binary_operand(node) { |l, r| l * r }
  end

  def evaluate_div(node)
    evaluate_binary_operand(node) { |l, r| l / r }
  end

  def evaluate_eq(node)
    evaluate_binary_operand(node) { |l, r| l == r }
  end

  def evaluate_not_eq(node)
    evaluate_binary_operand(node) { |l, r| l != r }
  end

  def evaluate_and(node)
    evaluate_binary_operand(node) { |l, r| l && r }
  end

  def evaluate_or(node)
    evaluate_binary_operand(node) { |l, r| l || r }
  end

  def evaluate_not(node)
    ! evaluate_node(node.op)
  end

  def evaluate_greater_than(node)
    evaluate_binary_operand(node) { |l, r| l > r }
  end

  def evaluate_greater_than_eq(node)
    evaluate_binary_operand(node) { |l, r| l >= r }
  end

  def evaluate_less_than(node)
    evaluate_binary_operand(node) { |l, r| l < r }
  end

  def evaluate_less_than_eq(node)
    evaluate_binary_operand(node) { |l, r| l <= r }
  end

  def evaluate_binary_operand(node, &block)
    yield evaluate_node(node.left), evaluate_node(node.right)
  end

  def evaluate_call(node)
    if fn = @builtins[node.name]
      args = node.args.map { |a| evaluate_node(a) }
      fn.call(args)
    elsif fn = @functions[node.name]
      raise "bad arity, expected #{fn.args.size} args, got #{node.args.size}" if node.args.size != fn.args.size

      parameters = {}
      fn.args.zip(node.args) { |name, arg| parameters[name] = evaluate_node(arg) }

      @frames.push(parameters)
      result = evaluate_nodes(fn.body)
      @returning = false
      @frames.pop

      result
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
      evaluate_nodes(node.else_block)
    else
      evaluate_nodes(node.if_block)
    end
  end

  def evaluate_nodes(nodes)
    result = nil

    nodes.each do |n|
      result = evaluate_node(n)
      raise "leaking AST nodes" if result.class.name =~ /Node/
      result = nil if result.class.name =~ /Node/

      break if @returning
    end

    result
  end

  def evaluate_def(node)
    @functions[node.name] = Function.new(node.name, node.args, node.body)
  end

  def evaluate_return(node)
    raise "cannot return outside of a function" if @frames.empty?

    @returning = true
    evaluate_node(node.value)
  end

  def evaluate_while(node)
    while evaluate_node(node.condition) != false && ! @returning && ! @breaking
      evaluate_nodes(node.block)
    end
  end

  def evaluate_break(node)
    @breaking = true

    nil
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
