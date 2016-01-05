require_relative 'token.rb'
require_relative 'lexer.rb'
require_relative 'bin_op.rb'
require_relative 'num.rb'

class Interpreter

  def initialize(lexer)
    @lexer = lexer
    @current_token = @lexer.get_next_token
  end

  def error
    raise 'Invalid syntax'
  end

  def eat(token_type)

    if @current_token.type == token_type
      @current_token = @lexer.get_next_token
    else
      error
    end
  end

  def factor

    token = @current_token

    if token.type == :integer
      eat(:integer)
      return Num.new(token)
    elsif token.type == :lparen
      eat(:lparen)
      node = expr
      eat(:rparen)
      return node
    end

  end

  def term
    node = factor

    while [:div, :mul].include?(@current_token.type)
      token = @current_token

      if token.type == :mul
        eat(:mul)
      elsif token.type == :div
        eat(:div)
      end
      node = BinOp(node, token, factor)
    end

    return node
  end

  def expr
    node = term

    while [:plus, :minus].include?(@current_token.type)
      token = @current_token

      if token.type == :plus
        eat(:plus)
      elsif token.type == :minus
        eat(:minus)
      end

    end

    node = BinOp(node, token, term)
  end

  def parse
    return expr
  end

end

def run
  puts "Interpreter: type exit to leave"
  while true
    print 'calc> '
    user_input = gets.chomp
    case user_input
    when "exit"
      break
    else
      lexer = Lexer.new(user_input)
      interpreter = Interpreter.new(lexer)
      result = interpreter.expr
      puts result
    end
  end
end

#run
