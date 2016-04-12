require 'test/unit'
require_relative '../lib/bin_op.rb'
require_relative '../lib/token.rb'

class TestBinOp < Test::Unit::TestCase

  def test_bin_op_init
    left = Token.new(:integer, 3)
    op = Token.new(:plus, '+')
    right = Token.new(:integer, 2)
    bin_op = BinOp.new(left, op, right)
    assert_equal 'Token(plus, +)', bin_op.op.to_s
  end

end
