require 'test/unit'
require_relative '../lib/lexer.rb'

class TestLexer < Test::Unit::TestCase

  def test_eof_found
    lexer = Lexer.new('');
    assert_equal 'Token(eof, )', lexer.get_next_token.to_s
  end

  def test_recognizes_digit
    lexer = Lexer.new('1')
    assert_equal 'Token(integer, 1)', lexer.get_next_token.to_s
  end

  def test_recognizes_plus_sign
    lexer = Lexer.new('+');
    assert_equal 'Token(plus, +)', lexer.get_next_token.to_s
  end

  def test_recognizes_minus_sign
    lexer = Lexer.new('-');
    assert_equal 'Token(minus, -)', lexer.get_next_token.to_s
  end

  def test_recognizes_two_digit
    lexer = Lexer.new('12');
    assert_equal 'Token(integer, 12)', lexer.get_next_token.to_s
  end

end
