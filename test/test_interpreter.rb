require 'test/unit'
require_relative '../lib/interpreter.rb'

class TestInterpreter < Test::Unit::TestCase

  def test_interpreter_eof_found
    interpreter = Interpreter.new('');
    assert_equal 'Token(EOF, )', interpreter.get_next_token.to_s
  end

end
