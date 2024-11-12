module Toto

using Vizagrams, Pluto, PlutoUI, HypertextLiteral

export Humain, Jeu, fin!, joue!, nouveau!, manche!

include("simplejeu.jl")

include("humains.jl")

end
