require_relative 'lexer.rb'
require_relative 'parser.rb'
require_relative 'node_visitor.rb'

class Interpreter < NodeVisitor

  def initialize(parser)
    @parser = parser
  end

  def visit_BinOp(node)
    if node.op.type == :PLUS
      return visit(node.left) + visit(node.right)
    elsif node.op.type == :MINUS
      return visit(node.left) - visit(node.right)
    elsif node.op.type == :MUL
      return visit(node.left) * visit(node.right)
    elsif node.op.type == :DIV
      return visit(node.left) / visit(node.right)
    end
  end

  def visit_Num(node)
    return node.value
  end

  def interpret
    tree = @parser.parse()
    return visit(tree)
  end
end
