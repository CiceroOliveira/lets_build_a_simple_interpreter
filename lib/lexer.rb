require_relative 'token.rb'

class Lexer
  def initialize(text)
    @text = text
    @pos = 0
    @current_char = @text[@pos]
  end

  def error
    raise 'Invalid character'
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

      if @current_char == '*'
        advance
        result = Token.new(:mul, '*')
        break
      end

      if @current_char == '/'
        advance
        result = Token.new(:div, '/')
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

      if @current_char == '('
        advance
        result = Token.new(:lparen, '(')
        break
      end

      if @current_char == ')'
        advance
        result = Token.new(:rparen, ')')
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

end
