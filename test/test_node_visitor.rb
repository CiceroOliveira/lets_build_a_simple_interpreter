require 'test/unit'
require_relative '../lib/token.rb'
require_relative '../lib/node_visitor.rb'

class TestCalculator < Test::Unit::TestCase

  def test_method_name
    token = Token.new(:num, 3)
    node_visitor = NodeVisitor.new()
    assert_equal :visit_num, node_visitor.visit(token)
  end

end
