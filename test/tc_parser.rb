require 'test/unit'
require_relative '../lib/parser.rb'

class TestParser < Test::Unit::TestCase

  def test_parse_bin_op_add
    lexer = Lexer.new('1+2')
    parser = Parser.new(lexer)
    result = parser.parse
    assert_equal 'BinOp', result.class.name
    assert_equal 1, result.left.value
    assert_equal '+', result.op.value
    assert_equal 2, result.right.value
  end

  def test_parse_bin_op_multiply
    lexer = Lexer.new('2*3')
    parser = Parser.new(lexer)
    result = parser.parse
    assert_equal 'BinOp', result.class.name
    assert_equal 2, result.left.value
    assert_equal '*', result.op.value
    assert_equal 3, result.right.value
  end
end

