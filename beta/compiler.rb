require 'pp'
require_relative 'parser'

class Instruction < Struct.new(:opcode, :operands)
end

class Compiler
  def initialize
    @bytecode = []
  end

  def compile(code)
    ast = Parser.new.parse(code)

    ast.nodes.each { |n| visit(n) }
    emit(:return)

    @bytecode
  end

  private

  def emit(op, *operands)
    inst = Instruction.new(op, operands)
    @bytecode << inst

    inst
  end

  def visit(node)
    if node.is_a?(LiteralNode)
      visit_literal(node)
      return
    end

    method = "visit" + node.class.name.gsub(/([A-Z])/) { "_#{$1.downcase}" }.gsub("_node", "")
    __send__(method, node)
  end

  def visit_literal(node)
    emit(:push, node.value)
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

  def visit_call(node)
    visit(node.args.first)

    emit(:call, node.name)
  end

  def visit_get_local(node)
    emit(:get_local, node.name)
  end

  def visit_set_local(node)
    visit(node.value)

    emit(:set_local, node.name)
  end

  def visit_if(node)
    visit(node.condition)

    branch = emit(:if, 0, 0)

    branch.operands[0] = @bytecode.length
    node.if_block.each { |n| visit(n) }
    jump = emit(:jump, 0)

    branch.operands[1] = @bytecode.length
    node.else_block.each { |n| visit(n) }

    jump.operands[0] = @bytecode.length
  end
end

if $0 == __FILE__
  pp Compiler.new.compile(File.read(ARGV[0]))
end
