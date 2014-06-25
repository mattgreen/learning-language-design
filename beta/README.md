# beta

Pure Ruby implementation of a simple programming language. Unlike alpha, we support several more concepts, such as mutable variables and flow control. This requires a real parser, so we use RACC as the parser generator.

Beta supports:

* Dynamic typing
* Assigning values to variables (`var = 42`)
* Basic operators: `+`, `-`, `*`, `/`
* Boolean operators: `==` and `!=`
* Flow control via `if` and `else`
* Three basic data types: integers, strings, and booleans (represented by `true`/`false`)
* 'Function' invocation (only `print` is supported)

## Example
    print("Hello, I am ")

    age = 1 + 4
    print(age)

## Installation
Install dependencies:

    $ cd beta
    $ bundle

## Running
To use the interpreter:

    $ bundle exec ruby interpreter.rb test/variables.txt

To try out the bytecode compiler + VM version:

    $ bundle exec ruby vm.rb test/variables.txt

