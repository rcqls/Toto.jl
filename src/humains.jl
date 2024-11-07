struct Humain
    last::String
    first::String
    age::Int
end

Base.show(io::IO, h::Humain) = println(io, "My name is $(h.first) $(h.last). I am $(h.age) years old!")