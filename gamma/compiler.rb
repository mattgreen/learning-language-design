require_relative 'parser'

class Compiler
  def initialize
    @bytecode = []
    @functions = {}

    @in_loop = false
    @breaks = []
  end

  def compile(code)
    ast = Parser.new.parse(code)

    ast.nodes.each { |n| visit(n) }
    emit(:end)

    @functions.each do |node|

    end

    @bytecode
  end

  private

  def emit(opcode, *operands)
    inst = Instruction.new(opcode, operands)
    @bytecode << inst

    inst
  end

  def visit(node)
    if node.is_a?(LiteralNode)
      return visit_literal(node)
    end

    method = "visit" + node.class.name.gsub(/([A-Z])/) { "_#{$1.downcase}" }.gsub("_node", "")
    __send__(method, node)
  end

  def visit_literal(node)
    emit(:push, node.value)
  end

  def visit_get_local(node)
    emit(:get_local, node.name)
  end

  def visit_set_local(node)
    visit(node.value)

    emit(:set_local, node.name)
  end

  def visit_op(node, &block)
    visit(node.left)
    visit(node.right)

    yield
  end

  def visit_add(node)
    visit_op(node) { emit(:add) }
  end

  def visit_sub(node)
    visit_op(node) { emit(:sub) }
  end

  def visit_mul(node)
    visit_op(node) { emit(:mul) }
  end

  def visit_div(node)
    visit_op(node) { emit(:div) }
  end

  def visit_eq(node)
    visit_op(node) { emit(:eq) }
  end

  def visit_not_eq(node)
    visit_op(node) { emit(:not_eq) }
  end

  def visit_less_than(node)
    visit_op(node) { emit(:lt) }
  end

  def visit_less_than_eq(node)
    visit_op(node) { emit(:lte) }
  end

  def visit_greater_than(node)
    visit_op(node) { emit(:gt) }
  end

  def visit_greater_than_eq(node)
    visit_op(node) { emit(:gte) }
  end

  def visit_and(node)
    visit_op(node) { emit(:and) }
  end

  def visit_or(node)
    visit_op(node) { emit(:or) }
  end

  def visit_not(node)
    visit(node.op)

    emit(:not)
  end

  def visit_call(node)
    node.args.each { |a| visit(a) }
    emit(:push, node.args.size)
    emit(:call, node.name)
  end

  def visit_def(node)
    @functions << node
  end

  def visit_if(node)
    visit(node.condition)

    branch = emit(:cjump, 0, 0)

    branch.operands[0] = @bytecode.length
    node.if_block.each { |n| visit(n) }
    jump = emit(:jump, 0)

    branch.operands[1] = @bytecode.length
    node.else_block.each { |n| visit(n) }

    jump.operands[0] = @bytecode.length
  end

  def visit_while(node)
    condition = @bytecode.length
    visit(node.condition)

    branch = emit(:cjump, 0, 0)
    branch.operands[0] = @bytecode.length

    @in_loop = true
    node.block.each { |n| visit(n) }
    @in_loop = false

    emit(:jump, condition)

    branch.operands[1] = @bytecode.length

    @breaks.each do |jump|
      jump.operands[0] = @bytecode.length
    end

    @breaks.clear
  end

  def visit_break(node)
    raise "can't break outside of a loop" unless @in_loop

    @breaks << emit(:jump, 0)
  end
end

class Instruction < Struct.new(:opcode, :operands)
end

if $0 == __FILE__
  require 'pp'
  pp Compiler.new.compile(File.read(ARGV[0]))
end
