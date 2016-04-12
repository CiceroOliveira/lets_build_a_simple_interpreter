require_relative 'ast.rb'

class Num < AST
  attr_reader :token, :value

  def initialize(token)
    @token = token
    @value = token.value
  end

end
