#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.11
# from Racc grammer file "".
#

require 'racc/parser.rb'

require_relative 'lexer'
require_relative 'ast'

class Parser < Racc::Parser

module_eval(<<'...end grammar.y/module_eval...', 'grammar.y', 43)
def parse(code, show_tokens = false)
  @tokens = Lexer.new.tokenize(code)
  puts @tokens.inspect if show_tokens
  do_parse
end

def next_token
  @tokens.shift
end

...end grammar.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
     7,     8,    11,     9,    10,     6,    16,    12,     7,     8,
    11,     9,    10,     6,    13,    12,     7,     8,    18,     9,
    10,     6 ]

racc_action_check = [
     0,     0,     0,     0,     0,     0,    13,     0,    14,    14,
     2,    14,    14,    14,     1,     2,     6,     6,    15,     6,
     6,     6 ]

racc_action_pointer = [
    -2,    14,     6,   nil,   nil,   nil,    14,   nil,   nil,   nil,
   nil,   nil,   nil,     6,     6,    10,   nil,   nil,   nil ]

racc_action_default = [
    -1,   -15,    -2,    -3,    -6,    -7,   -15,    -9,   -10,   -11,
   -12,   -13,   -14,   -15,    -5,   -15,    19,    -4,    -8 ]

racc_goto_table = [
     3,     4,     2,    14,     1,   nil,    15,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,    17 ]

racc_goto_check = [
     3,     4,     2,     4,     1,   nil,     3,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,     3 ]

racc_goto_pointer = [
   nil,     4,     2,     0,     1,   nil ]

racc_goto_default = [
   nil,   nil,   nil,   nil,   nil,     5 ]

racc_reduce_table = [
  0, 0, :racc_error,
  0, 11, :_reduce_1,
  1, 11, :_reduce_2,
  1, 12, :_reduce_3,
  3, 12, :_reduce_4,
  2, 12, :_reduce_5,
  1, 12, :_reduce_6,
  1, 13, :_reduce_none,
  3, 13, :_reduce_8,
  1, 15, :_reduce_9,
  1, 15, :_reduce_10,
  1, 15, :_reduce_11,
  1, 15, :_reduce_12,
  1, 14, :_reduce_none,
  1, 14, :_reduce_none ]

racc_reduce_n = 15

racc_shift_n = 19

racc_token_table = {
  false => 0,
  :error => 1,
  :NUMBER => 2,
  :STRING => 3,
  :NEWLINE => 4,
  :TRUE => 5,
  :FALSE => 6,
  "(" => 7,
  ")" => 8,
  ";" => 9 }

racc_nt_base = 10

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "NUMBER",
  "STRING",
  "NEWLINE",
  "TRUE",
  "FALSE",
  "\"(\"",
  "\")\"",
  "\";\"",
  "$start",
  "Program",
  "Expressions",
  "Expression",
  "Terminator",
  "Literal" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'grammar.y', 9)
  def _reduce_1(val, _values, result)
     result = AST.new([]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 10)
  def _reduce_2(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 14)
  def _reduce_3(val, _values, result)
     result = AST.new(val) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 15)
  def _reduce_4(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 16)
  def _reduce_5(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 17)
  def _reduce_6(val, _values, result)
     result = AST.new([]) 
    result
  end
.,.,

# reduce 7 omitted

module_eval(<<'.,.,', 'grammar.y', 22)
  def _reduce_8(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 26)
  def _reduce_9(val, _values, result)
     result = NumberNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 27)
  def _reduce_10(val, _values, result)
     result = StringNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 28)
  def _reduce_11(val, _values, result)
     result = TrueNode.new 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 29)
  def _reduce_12(val, _values, result)
     result = FalseNode.new 
    result
  end
.,.,

# reduce 13 omitted

# reduce 14 omitted

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Parser

if __FILE__ == $0
  puts Parser.new.parse(File.read(ARGV[0])).inspect
end