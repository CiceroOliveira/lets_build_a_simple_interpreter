require 'test/unit'
require_relative '../lib/token.rb'
require_relative '../lib/interpreter.rb'

class TestToken < Test::Unit::TestCase

  def test_to_s_method
    token = Token.new(:integer, 3)
    assert_equal 'Token(integer, 3)', token.to_s
  end

end
