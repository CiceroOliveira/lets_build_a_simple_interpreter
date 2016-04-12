require_relative 'ast.rb'

class BinOp < AST
  attr_reader :left, :op, :right, :token

  def initialize(left, op, right)
    @left = left
    @token = op
    @op = op
    @right = right
  end

end
