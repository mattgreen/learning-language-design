class Parser

token NUMBER
token STRING
token NEWLINE
token TRUE FALSE
token IDENTIFIER
token IF ELSE END
token DEF
token RETURN
token WHILE
token BREAK

prechigh
  right '!'
  left '*' '/'
  left '+' '-'
  left '>' '>=' '<' '<='
  left '==' '!='
  left '&&'
  left '||'
  right '='
  left ','
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
  | SetLocal
  | Function
  | While
  | Break
  | Return
  ;

  Expression:
    Literal
  | Operator
  | Call
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
  | Expression '<'  Expression { result = LessThanNode.new(val[0], val[2]) }
  | Expression '<=' Expression { result = LessThanEqNode.new(val[0], val[2]) }
  | Expression '>'  Expression { result = GreaterThanNode.new(val[0], val[2]) }
  | Expression '>=' Expression { result = GreaterThanEqNode.new(val[0], val[2]) }
  | Expression '==' Expression { result = EqNode.new(val[0], val[2]) }
  | Expression '!=' Expression { result = NotEqNode.new(val[0], val[2]) }
  | Expression '&&' Expression { result = AndNode.new(val[0], val[2]) }
  | Expression '||' Expression { result = OrNode.new(val[0], val[2]) }
  | '!' Expression             { result = NotNode.new(val[1]) }
  ;

  Call:
    IDENTIFIER Arguments      { result = CallNode.new(val[0], val[1]) }
  ;

  Arguments:
    '(' ')'                           { result = [] }
  | '(' Args ')'                      { result = val[1] }
  ;

  Args:
    Expression                        { result = [val[0]] }
  | Args ',' Expression               { result = val[0] << val[2] }
  ;


  GetLocal:
    IDENTIFIER                        { result = GetLocalNode.new(val[0]) }
  ;

  SetLocal:
    IDENTIFIER '=' Expression         { result = SetLocalNode.new(val[0], val[2]) }
  ;

  If:
    IF Expression Statements END                    { result = IfNode.new(val[1], val[2], []) }
  | IF Expression Statements ELSE Statements END    { result = IfNode.new(val[1], val[2], val[4]) }
  ;

  Function:
    DEF IDENTIFIER '(' ')' Statements END         { result = DefNode.new(val[1], [], val[4]) }
  | DEF IDENTIFIER '(' Params ')' Statements END  { result = DefNode.new(val[1], val[3], val[5]) }
  ;

  Params:
    IDENTIFIER                        { result = [val[0]] }
  | Params ',' IDENTIFIER             { result = val[0] << val[2] }
  ;

  Return:
    RETURN              { result = ReturnNode.new(nil) }
  | RETURN Expression   { result = ReturnNode.new(val[1]) }

  While:
    WHILE Expression Statements END    { result = WhileNode.new(val[1], val[2]) }
  ;

  Break:
    BREAK { result = BreakNode.new }
  ;

  Terminator:
    NEWLINE
  | ";"
  ;

---- header
require 'pp'
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
  pp Parser.new.parse(File.read(ARGV[0]))
end
