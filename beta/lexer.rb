class Lexer
  KEYWORDS = ["true", "false"]

  def tokenize(code)
    code.chomp!

    tokens = []

    i = 0
    while i < code.length
      chunk = code[i..-1]

      if identifier = chunk[/\A([a-z]\w*)/, 1]
        if KEYWORDS.include?(identifier)
          tokens << [identifier.upcase.to_sym, identifier]
        else
          tokens << [:IDENTIFIER, identifier]
        end

        i += identifier.length

      elsif number = chunk[/\A([0-9]+)/, 1]
        tokens << [:NUMBER, number.to_i]
        i += number.length

      elsif string = chunk[/\A"([^"]*)"/, 1]
        tokens << [:STRING, string]
        i += string.length + 2

      elsif chunk.match(/\A /)
        i += 1

      elsif chunk.match(/\A\n/)
        tokens << [:NEWLINE, "\n"]
        i += 1

      else
        value = chunk[0,1]
        tokens << [value, value]
        i += 1
      end
    end

    tokens
  end
end

if __FILE__ == $0
  puts Lexer.new.tokenize(File.read(ARGV[0])).inspect
end
