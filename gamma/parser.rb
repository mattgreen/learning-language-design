#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.11
# from Racc grammer file "".
#

require 'racc/parser.rb'

require 'pp'
require_relative 'lexer'
require_relative 'ast'

class Parser < Racc::Parser

module_eval(<<'...end grammar.y/module_eval...', 'grammar.y', 142)
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
    17,    18,    28,    19,    20,    22,    23,    28,    28,    24,
    25,    26,    27,    21,    17,    18,    28,    19,    20,    22,
    23,    35,    36,    24,    25,    26,    27,    21,    16,    83,
    29,    35,    36,    33,    34,    29,    29,    35,    36,    33,
    34,    78,    16,    77,    29,    17,    18,    28,    19,    20,
    22,    23,    75,    81,    24,    25,    26,    27,    21,    17,
    18,    28,    19,    20,    22,    23,    35,    36,    24,    25,
    26,    27,    21,    16,    49,    29,    35,    36,    33,    34,
    39,    40,    37,    38,    41,    42,    43,    16,    55,    29,
    17,    18,    28,    19,    20,    22,    23,    30,    93,    24,
    25,    26,    27,    21,    35,    36,    33,    34,    39,    40,
    37,    38,    41,    42,    43,    44,    52,    50,    16,    49,
    29,    17,    18,    28,    19,    20,    22,    23,   nil,   nil,
    24,    25,    26,    27,    21,    35,    36,    33,    34,    39,
    40,    37,    38,    41,    42,    43,    44,   nil,    89,    16,
    88,    29,    17,    18,    28,    19,    20,    22,    23,   nil,
   nil,    24,    25,    26,    27,    21,    17,    18,    28,    19,
    20,    46,    17,    18,    94,    19,    20,    46,   nil,    21,
    16,   nil,    29,   nil,   nil,    21,    17,    18,   nil,    19,
    20,    46,    28,   nil,    16,    71,    29,   nil,    91,    21,
    16,   nil,    17,    18,   nil,    19,    20,    46,    17,    18,
   nil,    19,    20,    46,    16,    21,   nil,   nil,    28,   nil,
    29,    21,    17,    18,    90,    19,    20,    22,    23,   nil,
    16,    24,    25,    26,    27,    21,    16,   nil,    17,    18,
   nil,    19,    20,    46,    17,    18,    29,    19,    20,    46,
    16,    21,   nil,   nil,   nil,    17,    18,    21,    19,    20,
    46,   nil,   nil,   nil,    28,   nil,    16,   nil,    21,   nil,
    84,   nil,    16,    17,    18,   nil,    19,    20,    46,    35,
    36,    33,    34,    16,    17,    18,    21,    19,    20,    46,
    17,    18,    29,    19,    20,    46,   nil,    21,   nil,   nil,
   nil,    16,   nil,    21,    17,    18,   nil,    19,    20,    46,
    17,    18,    16,    19,    20,    46,   nil,    21,    16,   nil,
   nil,    17,    18,    21,    19,    20,    46,   nil,   nil,   nil,
    28,   nil,    16,   nil,    21,    80,    79,   nil,    16,    17,
    18,   nil,    19,    20,    46,    35,    36,    33,    34,    16,
    17,    18,    21,    19,    20,    46,    17,    18,    29,    19,
    20,    46,   nil,    21,   nil,   nil,   nil,    16,   nil,    21,
    17,    18,   nil,    19,    20,    46,    17,    18,    16,    19,
    20,    46,   nil,    21,    16,   nil,   nil,    17,    18,    21,
    19,    20,    46,   nil,   nil,   nil,   nil,   nil,    16,   nil,
    21,   nil,   nil,   nil,    16,    35,    36,    33,    34,    39,
    40,    37,    38,    41,    42,    16,    35,    36,    33,    34,
    39,    40,    37,    38,    41,    42,    43,    44,   nil,   nil,
   nil,    69,    35,    36,    33,    34,    39,    40,    37,    38,
    41,    42,    43,    44,    35,    36,    33,    34,    39,    40,
    37,    38,    41,    42,    43,    44,    35,    36,    33,    34,
    39,    40,    37,    38,    41,    42,    43,    44,    35,    36,
    33,    34,    39,    40,    37,    38,    41,    42,    43,    44,
    35,    36,    33,    34,    39,    40,    37,    38,    41,    42,
    43,    44,    35,    36,    33,    34,    39,    40,    37,    38,
    35,    36,    33,    34,    39,    40,    37,    38 ]

racc_action_check = [
     0,     0,     0,     0,     0,     0,     0,    32,     2,     0,
     0,     0,     0,     0,    88,    88,    88,    88,    88,    88,
    88,    58,    58,    88,    88,    88,    88,    88,     0,    75,
     0,    61,    61,    61,    61,    32,     2,    64,    64,    64,
    64,    72,    88,    72,    88,    81,    81,    81,    81,    81,
    81,    81,    52,    75,    81,    81,    81,    81,    81,     4,
     4,     4,     4,     4,     4,     4,    57,    57,     4,     4,
     4,     4,     4,    81,    46,    81,    68,    68,    68,    68,
    68,    68,    68,    68,    68,    68,    68,     4,    30,     4,
    51,    51,    51,    51,    51,    51,    51,     1,    89,    51,
    51,    51,    51,    51,    51,    51,    51,    51,    51,    51,
    51,    51,    51,    51,    51,    51,    24,    22,    51,    22,
    51,    54,    54,    54,    54,    54,    54,    54,   nil,   nil,
    54,    54,    54,    54,    54,    54,    54,    54,    54,    54,
    54,    54,    54,    54,    54,    54,    54,   nil,    82,    54,
    82,    54,    80,    80,    80,    80,    80,    80,    80,   nil,
   nil,    80,    80,    80,    80,    80,    49,    49,    92,    49,
    49,    49,    33,    33,    92,    33,    33,    33,   nil,    49,
    80,   nil,    80,   nil,   nil,    33,    25,    25,   nil,    25,
    25,    25,    87,   nil,    49,    49,    92,   nil,    87,    25,
    33,   nil,    26,    26,   nil,    26,    26,    26,    23,    23,
   nil,    23,    23,    23,    25,    26,   nil,   nil,    86,   nil,
    87,    23,    31,    31,    86,    31,    31,    31,    31,   nil,
    26,    31,    31,    31,    31,    31,    23,   nil,    34,    34,
   nil,    34,    34,    34,    35,    35,    86,    35,    35,    35,
    31,    34,   nil,   nil,   nil,    36,    36,    35,    36,    36,
    36,   nil,   nil,   nil,    76,   nil,    34,   nil,    36,   nil,
    76,   nil,    35,    37,    37,   nil,    37,    37,    37,    62,
    62,    62,    62,    36,    38,    38,    37,    38,    38,    38,
    39,    39,    76,    39,    39,    39,   nil,    38,   nil,   nil,
   nil,    37,   nil,    39,    40,    40,   nil,    40,    40,    40,
    41,    41,    38,    41,    41,    41,   nil,    40,    39,   nil,
   nil,    42,    42,    41,    42,    42,    42,   nil,   nil,   nil,
    74,   nil,    40,   nil,    42,    74,    74,   nil,    41,    43,
    43,   nil,    43,    43,    43,    63,    63,    63,    63,    42,
    44,    44,    43,    44,    44,    44,    78,    78,    74,    78,
    78,    78,   nil,    44,   nil,   nil,   nil,    43,   nil,    78,
    50,    50,   nil,    50,    50,    50,    16,    16,    44,    16,
    16,    16,   nil,    50,    78,   nil,   nil,    21,    21,    16,
    21,    21,    21,   nil,   nil,   nil,   nil,   nil,    50,   nil,
    21,   nil,   nil,   nil,    16,    67,    67,    67,    67,    67,
    67,    67,    67,    67,    67,    21,    45,    45,    45,    45,
    45,    45,    45,    45,    45,    45,    45,    45,   nil,   nil,
   nil,    45,    85,    85,    85,    85,    85,    85,    85,    85,
    85,    85,    85,    85,     5,     5,     5,     5,     5,     5,
     5,     5,     5,     5,     5,     5,    53,    53,    53,    53,
    53,    53,    53,    53,    53,    53,    53,    53,    73,    73,
    73,    73,    73,    73,    73,    73,    73,    73,    73,    73,
    70,    70,    70,    70,    70,    70,    70,    70,    70,    70,
    70,    70,    66,    66,    66,    66,    66,    66,    66,    66,
    65,    65,    65,    65,    65,    65,    65,    65 ]

racc_action_pointer = [
    -2,    97,     4,   nil,    57,   428,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   374,   nil,   nil,   nil,
   nil,   385,    89,   206,   109,   184,   200,   nil,   nil,   nil,
    88,   220,     3,   170,   236,   242,   253,   271,   282,   288,
   302,   308,   319,   337,   348,   400,    44,   nil,   nil,   164,
   368,    88,    22,   440,   119,   nil,   nil,    50,     5,   nil,
   nil,    15,   263,   329,    21,   484,   476,   389,    60,   nil,
   464,   nil,    12,   452,   326,    22,   260,   nil,   354,   nil,
   150,    43,   119,   nil,   nil,   416,   214,   188,    12,    91,
   nil,   nil,   164,   nil,   nil ]

racc_action_default = [
    -1,   -56,    -2,    -3,    -7,    -8,    -9,   -10,   -11,   -12,
   -13,   -14,   -15,   -16,   -17,   -18,   -56,   -20,   -21,   -22,
   -23,   -56,   -42,   -56,   -56,   -50,   -56,   -53,   -54,   -55,
   -56,    -5,    -6,   -56,   -56,   -56,   -56,   -56,   -56,   -56,
   -56,   -56,   -56,   -56,   -56,   -56,   -42,   -36,   -37,   -56,
   -56,   -56,   -56,   -51,   -56,    95,    -4,   -24,   -25,   -26,
   -27,   -28,   -29,   -30,   -31,   -32,   -33,   -34,   -35,   -19,
   -40,   -38,   -56,   -43,   -56,   -56,   -56,   -39,   -56,   -44,
   -56,   -56,   -56,   -48,   -52,   -41,   -56,   -56,   -56,   -56,
   -45,   -46,   -56,   -49,   -47 ]

racc_goto_table = [
    31,     2,     1,    56,    72,    32,    82,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,    45,   nil,   nil,   nil,   nil,    47,
   nil,    51,   nil,    53,    54,   nil,   nil,   nil,   nil,   nil,
    31,    57,    58,    59,    60,    61,    62,    63,    64,    65,
    66,    67,    68,   nil,   nil,   nil,   nil,    70,    73,   nil,
   nil,   nil,    74,   nil,   nil,    76,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,    31,   nil,    31,   nil,    85,   nil,   nil,   nil,
   nil,    86,    87,   nil,    31,    31,   nil,   nil,   nil,    92,
    31 ]

racc_goto_check = [
     4,     2,     1,     3,    17,     2,    18,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,     5,   nil,   nil,   nil,   nil,     5,
   nil,     5,   nil,     5,     5,   nil,   nil,   nil,   nil,   nil,
     4,     5,     5,     5,     5,     5,     5,     5,     5,     5,
     5,     5,     5,   nil,   nil,   nil,   nil,     5,     5,   nil,
   nil,   nil,     2,   nil,   nil,     2,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,     4,   nil,     4,   nil,     5,   nil,   nil,   nil,
   nil,     2,     2,   nil,     4,     4,   nil,   nil,   nil,     2,
     4 ]

racc_goto_pointer = [
   nil,     2,     1,   -28,    -2,    -2,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   -45,   -69 ]

racc_goto_default = [
   nil,   nil,   nil,     3,     4,     5,     6,     7,     8,     9,
    10,    11,    12,    13,    14,    15,    48,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  0, 34, :_reduce_1,
  1, 34, :_reduce_2,
  1, 35, :_reduce_3,
  3, 35, :_reduce_4,
  2, 35, :_reduce_5,
  2, 35, :_reduce_6,
  1, 35, :_reduce_7,
  1, 36, :_reduce_none,
  1, 36, :_reduce_none,
  1, 36, :_reduce_none,
  1, 36, :_reduce_none,
  1, 36, :_reduce_none,
  1, 36, :_reduce_none,
  1, 36, :_reduce_none,
  1, 38, :_reduce_none,
  1, 38, :_reduce_none,
  1, 38, :_reduce_none,
  1, 38, :_reduce_none,
  3, 38, :_reduce_19,
  1, 45, :_reduce_20,
  1, 45, :_reduce_21,
  1, 45, :_reduce_22,
  1, 45, :_reduce_23,
  3, 46, :_reduce_24,
  3, 46, :_reduce_25,
  3, 46, :_reduce_26,
  3, 46, :_reduce_27,
  3, 46, :_reduce_28,
  3, 46, :_reduce_29,
  3, 46, :_reduce_30,
  3, 46, :_reduce_31,
  3, 46, :_reduce_32,
  3, 46, :_reduce_33,
  3, 46, :_reduce_34,
  3, 46, :_reduce_35,
  2, 46, :_reduce_36,
  2, 47, :_reduce_37,
  2, 49, :_reduce_38,
  3, 49, :_reduce_39,
  1, 50, :_reduce_40,
  3, 50, :_reduce_41,
  1, 48, :_reduce_42,
  3, 40, :_reduce_43,
  4, 39, :_reduce_44,
  6, 39, :_reduce_45,
  6, 41, :_reduce_46,
  7, 41, :_reduce_47,
  1, 51, :_reduce_48,
  3, 51, :_reduce_49,
  1, 44, :_reduce_50,
  2, 44, :_reduce_51,
  4, 42, :_reduce_52,
  1, 43, :_reduce_53,
  1, 37, :_reduce_none,
  1, 37, :_reduce_none ]

racc_reduce_n = 56

racc_shift_n = 95

racc_token_table = {
  false => 0,
  :error => 1,
  :NUMBER => 2,
  :STRING => 3,
  :NEWLINE => 4,
  :TRUE => 5,
  :FALSE => 6,
  :IDENTIFIER => 7,
  :IF => 8,
  :ELSE => 9,
  :END => 10,
  :DEF => 11,
  :RETURN => 12,
  :WHILE => 13,
  :BREAK => 14,
  "!" => 15,
  "*" => 16,
  "/" => 17,
  "+" => 18,
  "-" => 19,
  ">" => 20,
  ">=" => 21,
  "<" => 22,
  "<=" => 23,
  "==" => 24,
  "!=" => 25,
  "&&" => 26,
  "||" => 27,
  "=" => 28,
  "," => 29,
  "(" => 30,
  ")" => 31,
  ";" => 32 }

racc_nt_base = 33

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
  "IDENTIFIER",
  "IF",
  "ELSE",
  "END",
  "DEF",
  "RETURN",
  "WHILE",
  "BREAK",
  "\"!\"",
  "\"*\"",
  "\"/\"",
  "\"+\"",
  "\"-\"",
  "\">\"",
  "\">=\"",
  "\"<\"",
  "\"<=\"",
  "\"==\"",
  "\"!=\"",
  "\"&&\"",
  "\"||\"",
  "\"=\"",
  "\",\"",
  "\"(\"",
  "\")\"",
  "\";\"",
  "$start",
  "Program",
  "Statements",
  "Statement",
  "Terminator",
  "Expression",
  "If",
  "SetLocal",
  "Function",
  "While",
  "Break",
  "Return",
  "Literal",
  "Operator",
  "Call",
  "GetLocal",
  "Arguments",
  "Args",
  "Params" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'grammar.y', 27)
  def _reduce_1(val, _values, result)
     result = AST.new([]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 28)
  def _reduce_2(val, _values, result)
     result = AST.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 32)
  def _reduce_3(val, _values, result)
     result = val 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 33)
  def _reduce_4(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 34)
  def _reduce_5(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 35)
  def _reduce_6(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 36)
  def _reduce_7(val, _values, result)
     result = [] 
    result
  end
.,.,

# reduce 8 omitted

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

# reduce 12 omitted

# reduce 13 omitted

# reduce 14 omitted

# reduce 15 omitted

# reduce 16 omitted

# reduce 17 omitted

# reduce 18 omitted

module_eval(<<'.,.,', 'grammar.y', 54)
  def _reduce_19(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 58)
  def _reduce_20(val, _values, result)
     result = NumberNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 59)
  def _reduce_21(val, _values, result)
     result = StringNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 60)
  def _reduce_22(val, _values, result)
     result = TrueNode.new 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 61)
  def _reduce_23(val, _values, result)
     result = FalseNode.new 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 65)
  def _reduce_24(val, _values, result)
     result = AddNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 66)
  def _reduce_25(val, _values, result)
     result = SubNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 67)
  def _reduce_26(val, _values, result)
     result = MulNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 68)
  def _reduce_27(val, _values, result)
     result = DivNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 69)
  def _reduce_28(val, _values, result)
     result = LessThanNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 70)
  def _reduce_29(val, _values, result)
     result = LessThanEqNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 71)
  def _reduce_30(val, _values, result)
     result = GreaterThanNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 72)
  def _reduce_31(val, _values, result)
     result = GreaterThanEqNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 73)
  def _reduce_32(val, _values, result)
     result = EqNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 74)
  def _reduce_33(val, _values, result)
     result = NotEqNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 75)
  def _reduce_34(val, _values, result)
     result = AndNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 76)
  def _reduce_35(val, _values, result)
     result = OrNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 77)
  def _reduce_36(val, _values, result)
     result = NotNode.new(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 81)
  def _reduce_37(val, _values, result)
     result = CallNode.new(val[0], val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 85)
  def _reduce_38(val, _values, result)
     result = [] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 86)
  def _reduce_39(val, _values, result)
     result = val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 90)
  def _reduce_40(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 91)
  def _reduce_41(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 96)
  def _reduce_42(val, _values, result)
     result = GetLocalNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 100)
  def _reduce_43(val, _values, result)
     result = SetLocalNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 104)
  def _reduce_44(val, _values, result)
     result = IfNode.new(val[1], val[2], []) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 105)
  def _reduce_45(val, _values, result)
     result = IfNode.new(val[1], val[2], val[4]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 109)
  def _reduce_46(val, _values, result)
     result = DefNode.new(val[1], [], val[4]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 110)
  def _reduce_47(val, _values, result)
     result = DefNode.new(val[1], val[3], val[5]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 114)
  def _reduce_48(val, _values, result)
     result = [val[0]] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 115)
  def _reduce_49(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 119)
  def _reduce_50(val, _values, result)
     result = ReturnNode.new(nil) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 120)
  def _reduce_51(val, _values, result)
     result = ReturnNode.new(val[1]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 123)
  def _reduce_52(val, _values, result)
     result = WhileNode.new(val[1], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 127)
  def _reduce_53(val, _values, result)
     result = BreakNode.new 
    result
  end
.,.,

# reduce 54 omitted

# reduce 55 omitted

def _reduce_none(val, _values, result)
  val[0]
end

end   # class Parser

if __FILE__ == $0
  pp Parser.new.parse(File.read(ARGV[0]))
end
