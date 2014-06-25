class Parser

token NUMBER
token STRING
token NEWLINE
token TRUE FALSE
token IDENTIFIER
token IF ELSE END

prechigh
  left '*' '/'
  left '+' '-'
preclow

rule
  Program:
                  { result = AST.new([]) }
  | Statements    { result = AST.new(val[0]) }
  ;

  Statements:
    Statement                       { result = val }
  | Statements Terminator Statement { result = val[0] << val[2] }
  | Statements Terminator           { result = val[0] }
  | Terminator Statements           { result = val[1] }
  | Terminator                      { result = [] }
  ;

  Statement:
    Expression
  | If
  | Call
  | SetLocal

  Expression:
    Literal
  | Operator
  | GetLocal
  | '(' Expression ')'        { result = val[1] }
  ;

  Literal:
    NUMBER    { result = NumberNode.new(val[0]) }
  | STRING    { result = StringNode.new(val[0]) }
  | TRUE      { result = TrueNode.new }
  | FALSE     { result = FalseNode.new }
  ;

  Operator:
    Expression '+'  Expression { result = AddNode.new(val[0], val[2]) }
  | Expression '-'  Expression { result = SubNode.new(val[0], val[2]) }
  | Expression '*'  Expression { result = MulNode.new(val[0], val[2]) }
  | Expression '/'  Expression { result = DivNode.new(val[0], val[2]) }
  | Expression '==' Expression { result = EqNode.new(val[0], val[2]) }
  | Expression '!=' Expression { result = NotEqNode.new(val[0], val[2]) }
  ;

  Call:
    IDENTIFIER '(' Expression ')'     { result = CallNode.new(val[0], [val[2]]) }
  ;

  GetLocal:
    IDENTIFIER                        { result = GetLocalNode.new(val[0]) }
  ;

  SetLocal:
    IDENTIFIER '=' Expression           { result = SetLocalNode.new(val[0], val[2]) }
  ;

  If:
    IF Expression Statements END                    { result = IfNode.new(val[1], val[2], []) }
  | IF Expression Statements ELSE Statements END    { result = IfNode.new(val[1], val[2], val[4]) }
  ;

  Terminator:
    NEWLINE
  | ";"
  ;

---- header
require_relative 'lexer'
require_relative 'ast'

---- inner
def parse(code, show_tokens = false)
  @tokens = Lexer.new.tokenize(code)
  puts @tokens.inspect if show_tokens
  do_parse
end

def next_token
  @tokens.shift
end

---- footer
if __FILE__ == $0
  puts Parser.new.parse(File.read(ARGV[0])).inspect
end
