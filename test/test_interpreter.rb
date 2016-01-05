require 'test/unit'
require_relative '../lib/interpreter.rb'

class TestInterpreter < Test::Unit::TestCase

  def test_interpreter_recognizes_two_digit
    interpreter = Interpreter.new('12');
    assert_equal 'Token(integer, 12)', interpreter.get_next_token.to_s
  end


end
