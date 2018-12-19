using Test, PropDicts

@testset "Get Set" begin
    d = PropDict(a=1, b=2)
    @testset "get" begin
        @test d.a == 1
        @test d.b == 2
        # unknown key
        @test_throws KeyError d.k
    end

    @testset "set" begin
        d.a = 7
        @test d.a == 7

        # unknown key no wuzzas
        d.j = "11"
        @test d.j == "11"
    end

    @testset "typed" begin
        dt = PropDict{Int}(a=1)
        @test @inferred getproperty(dt, :a) == 1
        @test_throws ErrorException @inferred getproperty(d, :a)
    end
end
