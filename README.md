# Quine

Prints out a quine with n variables

## Installation

```julia
(@v1.5) pkg> add https://github.com/jin-park/Quine.jl.git
julia> using Quine
```

## Examples

```julia
julia> using Quine

julia> generate_quine(3)
c = :(println("c = :(" * string(c) * ")\nb = :(eval(c); println(\"a = :(eval(b))\\neval(a)\"))"))
b = :(eval(c); println("a = :(eval(b))\neval(a)"))
a = :(eval(b))
eval(a)

julia> generate_quine(5)
e = :(println("e = :(" * string(e) * ")\nd = :(eval(e); println(\"c = :(eval(d); println(\\\"b = :(eval(c); println(\\\\\\\"a = :(eval(b))\\\\\\\\neval(a)\\\\\\\"))\\\"))\"))"))
d = :(eval(e); println("c = :(eval(d); println(\"b = :(eval(c); println(\\\"a = :(eval(b))\\\\neval(a)\\\"))\"))"))
c = :(eval(d); println("b = :(eval(c); println(\"a = :(eval(b))\\neval(a)\"))"))
b = :(eval(c); println("a = :(eval(b))\neval(a)"))
a = :(eval(b))
eval(a)
```

## Well why should I care?

Definition of quine from wikipedia: A **quine** is a computer program which takes no input and produces a copy of its own source code as its only output. If that isn't the coolest thing ever then I don't know what is.
