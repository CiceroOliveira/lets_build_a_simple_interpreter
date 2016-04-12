require 'test/unit'
require_relative '../lib/interpreter.rb'
require_relative '../lib/bin_op.rb'

class TestInterpreter < Test::Unit::TestCase

  def test_calculator_multiplies
    token = Token.new(:mul, '*')
    node = BinOp.new(
      Num.new(Token.new(:integer, 2)),
      token,
      Num.new(Token.new(:integer, 3))
    )

    interpreter = Interpreter.new(nil);
    assert_equal 6, interpreter.visit(node)
  end

  def test_calculator_divides
    token = Token.new(:div, '/')
    node = BinOp.new(
      Num.new(Token.new(:integer, 8)),
      token,
      Num.new(Token.new(:integer, 2))
    )
    interpreter = Interpreter.new(nil);
    assert_equal 4, interpreter.visit(node)
  end

  def test_calculator_divides_returns_integer
    token = Token.new(:div, '/')
    node = BinOp.new(
      Num.new(Token.new(:integer, 9)),
      token,
      Num.new(Token.new(:integer, 2))
    )
    interpreter = Interpreter.new(nil);
    assert_equal 4, interpreter.visit(node)
  end

  def test_calculator_adds
    token = Token.new(:plus, '+')
    node = BinOp.new(
      Num.new(Token.new(:integer, 2)),
      token,
      Num.new(Token.new(:integer, 3))
    )

    interpreter = Interpreter.new(nil);
    assert_equal 5, interpreter.visit(node)
  end

  def test_calculator_subtracts_handles_negative_results
    token = Token.new(:minus, '-')
    node = BinOp.new(
      Num.new(Token.new(:integer, 2)),
      token,
      Num.new(Token.new(:integer, 3))
    )

    interpreter = Interpreter.new(nil);
    assert_equal -1, interpreter.visit(node)
  end

  def test_calculator_subtracts
    token = Token.new(:minus, '-')
    node = BinOp.new(
      Num.new(Token.new(:integer, 5)),
      token,
      Num.new(Token.new(:integer, 3))
    )

    interpreter = Interpreter.new(nil);
    assert_equal 2, interpreter.visit(node)
  end

  def test_calculator_many_terms
    token = Token.new(:minus, '-')
    left_node = BinOp.new(
      Num.new(Token.new(:integer, 13)),
      token,
      Num.new(Token.new(:integer, 3))
    )

    node = BinOp.new(
      left_node,
      token,
      Num.new(Token.new(:integer, 2))
    )

    interpreter = Interpreter.new(nil);
    assert_equal 8, interpreter.visit(node)
  end

  def test_it_works_with_parser
    lexer = Lexer.new('1+2')
    parser = Parser.new(lexer)
    @interpreter = Interpreter.new(parser)
    assert_equal 3, @interpreter.interpret()
  end
end
