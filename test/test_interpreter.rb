require 'test/unit'
require_relative '../lib/interpreter.rb'

class TestInterpreter < Test::Unit::TestCase

  def test_interpreter_recognizes_two_digit
    interpreter = Interpreter.new('12');
    assert_equal 'Token(integer, 12)', interpreter.get_next_token.to_s
  end

  def test_interpreter_is_digit
    interpreter = Interpreter.new('');
    assert_true interpreter.is_digit("1")
  end

  def test_interpreter_is_digit_a
    interpreter = Interpreter.new('');
    assert_false interpreter.is_digit("q")
  end

  def test_interpreter_empty_string_is_space
    interpreter = Interpreter.new('');
    assert_true interpreter.is_space("")
  end

  def test_interpreter_space_is_space
    interpreter = Interpreter.new(' ');
    assert_true interpreter.is_space("")
  end

end
