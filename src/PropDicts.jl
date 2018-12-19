module PropDicts

export PropDict

struct PropDict{V}
    _kvs::Dict{Symbol, V}
end
PropDict(; kwargs...) = PropDict(Dict{Symbol, Any}(kwargs...))
PropDict{T}(; kwargs...) where T = PropDict(Dict{Symbol, T}(kwargs...))

function Base.getproperty(pd::PropDict, x::Symbol)
    kvs = getfield(pd, :_kvs)
    return kvs[x]
end

# Base.getproperty(pd::PropDict, ::Val{:_kvs}) = getfield(pd, :_kvs)
# Base.setproperty!(pd::PropDict, ::Val{:_kvs}, v) = setfield!(pd, :_kvs, v)

function Base.setproperty!(pd::PropDict, x::Symbol, v)
    kvs = getfield(pd, :_kvs)
    return kvs[x] = v
end

end # module PropDicts

:_kvs isa Val{:_kvs}
