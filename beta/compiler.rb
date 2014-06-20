require 'pp'
require_relative 'parser'

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
    @bytecode << op
    @bytecode.concat(operands)
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
end

if $0 == __FILE__
  pp Compiler.new.compile(File.read(ARGV[0]))
end
