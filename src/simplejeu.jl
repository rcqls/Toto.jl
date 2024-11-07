mutable struct Jeu
    ## 2 joueurs (dont le 2ème est l'ordi)
    manches::Tuple{Vector{Int},Vector{Int}}
    gains::Vector{Int}
    maxmanches::Int
end

Jeu() = Jeu((Int[], Int[]), [0,0], 3)

nouveau(jeu::Jeu) = jeu.manches, jeu.gains = (Int[], Int[]), [0,0] 

function joue(jeu::Jeu)
    manche(jeu)
    if !fin(jeu)
        joue(jeu)
    end
end

function manche(jeu::Jeu)
    joueur1 = rand(1:10)
    joueur2 = rand(1:10)
    push!(jeu.manches[1], joueur1)
    push!(jeu.manches[2], joueur2)
    if joueur1 > joueur2
        jeu.gains[1] += 1
    elseif joueur2 > joueur1
        jeu.gains[2] += 1
    end
end

fin(jeu::Jeu) = any(jeu.gains .>= jeu.maxmanches)