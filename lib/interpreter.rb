require_relative 'calc1.rb'

class Interpreter

  def initialize(text)
    @text = text
    @pos = 0
    @current_token = nil
  end

  def error
    raise 'Error parsing input'
  end

  def get_next_token
    text = @text

    if @pos > text.length - 1
      return Token.new(:eof, nil)
    end

    current_char = @text[@pos]

    if current_char =~/[0-9]/
        token = Token.new(:integer, current_char.to_i)
        @pos += 1
        return token
    end

    if current_char == '+'
        token = Token.new(:plus, current_char)
        @pos += 1
        return token
    end

    error
    #if current_char =~/[A-Za-z]/
    #    token = Token.new('INTEGER', current_char.to_i)
    #    @pos += 1
    #    return token
    #end
  end

  def eat(token_type)
    token = @current_token

    if @current_token.type == token_type
      @current_token = get_next_token
    else
      error
    end
  end

  def expr
    @current_token = get_next_token

    left = @current_token
    eat(:integer)

    op = @current_token
    eat(:plus)

    right = @current_token
    eat(:integer)

    return left.value + right.value
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
      interpreter = Interpreter.new(user_input)
      result = interpreter.expr
      puts result
    end
  end
end

#run
