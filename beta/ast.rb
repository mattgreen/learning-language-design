class AST < Struct.new(:nodes)
  def <<(node)
    nodes << node

    self
  end
end

class LiteralNode < Struct.new(:value)
end

class NumberNode < LiteralNode
end

class StringNode < LiteralNode
end

class TrueNode < LiteralNode
  def initialize
    super(true)
  end
end

class FalseNode < LiteralNode
  def initialize
    super(false)
  end
end

class CallNode < Struct.new(:name, :args)
end

class OpNode < Struct.new(:left, :right)
end

class AddNode < OpNode
end

class SubNode < OpNode
end

class MulNode < OpNode
end

class DivNode < OpNode
end

class EqNode < OpNode
end

class NotEqNode < OpNode
end

class GetLocalNode < Struct.new(:name)
end

class SetLocalNode < Struct.new(:name, :value)
end

class IfNode < Struct.new(:condition, :if_block, :else_block)
end
