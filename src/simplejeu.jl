mutable struct Jeu
    ## 2 joueurs (dont le 2ème est l'ordi)
    manches::Tuple{Vector{Int},Vector{Int}}
    gains::Vector{Int}
    maxmanches::Int
    fin::Bool
end

Jeu() = Jeu((Int[], Int[]), [0,0,0], 3, false)

nouveau!(jeu::Jeu) = jeu.manches, jeu.gains, jeu.fin = (Int[], Int[]), [0,0,0], false 

function joue!(jeu::Jeu)
    if !jeu.fin
        manche!(jeu)
        joue!(jeu)
    end
end

function manche!(jeu::Jeu)
    if !jeu.fin
        joueur1 = rand(1:10)
        joueur2 = rand(1:10)
        push!(jeu.manches[1], joueur1)
        push!(jeu.manches[2], joueur2)
        if joueur1 > joueur2
            jeu.gains[1] += 1
        elseif joueur2 > joueur1
            jeu.gains[2] += 1
        else 
            jeu.gains[3] += 1 # égalité
        end
        fin!(jeu)
    end
end

fin!(jeu::Jeu) = jeu.fin = any(jeu.gains[1:end-1] .>= jeu.maxmanches)

function Vizagrams.draw(jeu::Jeu)
    d = TextMark(text=isempty(jeu.manches[1]) ? "Début de partie" : "$(jeu.manches[1][end]) vs $(jeu.manches[2][end])", fontsize=14)
    return draw(d, height=100)
end

function interaction()
    d = S(:fill=>:blue)*(S(:__id => :circ)T(3,0)Circle() + S(:__id => :tri)T(0,2)RegularPolygon(n=3) +
    S(:__id => :sq)R(π/10)U(2)Square()) +
    T(2,-2)S(:stroke=>:red,:strokeWidth=>5)Line([[0,0],[3,0],[3,3]])
 	return draw(d, height=400; :id => :graph)
end