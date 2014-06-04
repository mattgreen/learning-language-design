# alpha

## Introduction
Pure Ruby implementation of a very simple programming language. Actually, it probably doesn't meet the definition of a programming language, as it lacks variables, flow control and other necessities. However, it is processed in a similar manner as a programming language during compilation.

Nevertheless, it does illustrate many of the moving parts of a compiler.

This is part of a series of tiny languages I'm creating to learn programming language design and theory. Subsequent languages will contain more features.

## Running
Pass the input file as the first argument:

    $ ruby alpha.rb input.txt

To switch between interpreted and compiled execution, uncomment the appropriate line in `alpha.rb`.

## Structure

1. `Lexer` splits up the input file into a series of tokens
2. `Parser` consumes these tokens to build an Abstract Syntax Tree. In this language, it is represented by an Array of `PrintNode`'s.
3. `Interpreter` traverses the AST, pulls out the data from each node, and evaluates it
4. `Compiler` emits bytecode (represented as an Array) that the `VM` consumes. The bytecode presupposes use of a stack.

## Semantics
In this language, the only valid statement is a print statement:

    print "Hello"
    print "This will get printed out upon execution"

The compiler accepts input files containing 0-n lines, where each line contains a print statement, a comment (starting with `#`), or is left blank. Syntax errors are reported with a corresponding line number.

