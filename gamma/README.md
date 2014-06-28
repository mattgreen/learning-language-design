#gamma

A small, Ruby-like language implemented in Ruby. Unlike beta, we support more advanced control flow (loops), as well as functions. Both of these constructs result in significantly more complexity, particularly in the virtual machine implementation.

Gamma supports:

* Dynamic typing
* Mutable variables (`name = "Matt"`)
* Flow control via `if` and `else`
* Functions with 0-n arguments
* While loops, including `break`
* Three data types: integers, strings, and booleans
* Operators: `+`, `-`, `*`, `/`
* Comparison operators: `<`, `>`, `<=`, `>=`, `==`, `!=`
* Boolean operators: `&&`, `||`, `!` (parenthesis may be used to elevate precedence)
* Built-in `print` function for outputting results

The syntax is kept close to Ruby's. One noteworthy difference is that function definitions must include parenthesis.

## Examples

Fibonacci sequence:
````ruby
def fib(n)
  if n == 1
    return 1
  end

  if n == 2
    return 1
  end

  fib(n - 1) + fib(n - 2)
end

print(fib(20))
````

A simple countdown program:
````ruby
a = 10

while a >= 0
  print(a)

  if a == 4
    break
  end

  a = a - 1
end
````

## Installation
````
cd gamma
bundle
````

## Running
Run a program using the interpreter:

    $ bundle exec ruby interpreter.rb test/fib.txt

Run a program using the VM:

    $ bundle exec ruby vm.rb test/fib.txt
