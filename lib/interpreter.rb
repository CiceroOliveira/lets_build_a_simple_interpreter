require_relative 'token.rb'

class Interpreter

  def initialize(text)
    @text = text
    @pos = 0
    @current_token = nil
    @current_char = @text[@pos]
  end

  def error
    raise 'Error parsing input'
  end

  def advance
    @pos += 1

    if @pos > @text.length - 1
      @current_char = nil
    else
      @current_char = @text[@pos]
    end
  end

  def is_space(string)
    !string.nil? && string.strip.length == 0
  end

  def is_digit(string)
    (string =~ /\d/) == 0 ? true : false
  end

  def skip_whitespace
    while is_space(@current_char)
      advance
    end
  end

  def integer
    result = ''
    while is_digit(@current_char)
      result += @current_char
      advance
    end
    return result.to_i
  end

  def get_next_token

    return Token.new(:eof, nil) if @current_char.nil?

    result = nil

    while !@current_char.nil? do

      if is_space(@current_char)
        skip_whitespace
        next
      end

      if is_digit(@current_char)
        result = Token.new(:integer, integer)
        break
      end

      if @current_char == '+'
        advance
        result = Token.new(:plus, '+')
        break
      end

      if @current_char == '-'
        advance
        result = Token.new(:minus, '-')
        break
      end

      error

    end

    return result

    #if current_char =~/[A-Za-z]/
    #    token = Token.new('INTEGER', current_char.to_i)
    #    @pos += 1
    #    return token
    #end
  end

  def eat(token_type)

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
    if op.type == :plus
      eat(:plus)
    else
      eat(:minus)
    end

    right = @current_token
    eat(:integer)

    if op.type == :plus
      result = left.value + right.value
    else
      result = left.value - right.value
    end

    result
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

run
