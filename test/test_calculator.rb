require 'test/unit'
require_relative '../lib/calculator.rb'

class TestCalculator < Test::Unit::TestCase

  def test_calculator_multiplies
    calculator = Calculator.new('2*3')
    assert_equal 6, calculator.calculate()
  end

end
