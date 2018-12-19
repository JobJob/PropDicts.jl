# PropDicts.jl
Dictionaries with items accessed with d.x instead of d[x] - like python's AttrDict but for Julia

## Disclaimer

This package was thrown together very quickly for fun.

## Install
using Pkg; pkg"add https://github.com/JobJob/PropDicts.jl.git"

## Usage

```julia
using PropDicts
d = PropDict(a=1, b="2")
d.a = 7
```

### Typed

```julia
using PropDicts, Test
dtyped = PropDict{Float64}(x=0.3, y=1.9)
@inferred getproperty(dtyped, :x) # the compiler knows it's a Float64

# doesn't work in untyped PropDict
d = PropDict(x=0.3, y=1.9)
@inferred getproperty(d, :x)  # the compiler doesn't know so this errors
```
