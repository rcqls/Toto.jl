### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    #! format: off
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
    #! format: on
end

# ╔═╡ 50063b26-52bc-4a42-a3ad-42fab4e9d659
begin
	import Pkg
    ## IMPORTANT, si vous avez cloné le package: git clone https://github.com/rcqls/Toto.jl
    ## Ouvrir julia à l'endroit de Toto.jl et faites en mode pkg (taper "]"): instantiate
	Pkg.activate("..")
	using Vizagrams, PlutoUI, HypertextLiteral
	using Toto
	jeu = Jeu()
	nothing
end

# ╔═╡ 797171d2-4083-4e2c-9cb2-930f2367ab1f
begin
	svgp = Toto.interaction()
@bind etat @htl(
"""
<div>
	
	$(svgp)
	
	<script>
	const div = currentScript.parentElement;

	var svgelt = div.querySelector("#graph");

	svgelt.addEventListener("click", get_id, false);

	function get_id(evt) {
		div.value = evt.target.id;
		div.dispatchEvent(new CustomEvent("input"));
	}
	</script>
</div>
		
"""
)
end

# ╔═╡ dc093c86-8f9d-497e-a40d-2b256703b5a7
begin
	if etat == "sq" 
		manche!(jeu)
	elseif etat == "tri"
		nouveau!(jeu)
	end
	update_view=rand()
	draw(jeu)
end

# ╔═╡ Cell order:
# ╟─50063b26-52bc-4a42-a3ad-42fab4e9d659
# ╟─dc093c86-8f9d-497e-a40d-2b256703b5a7
# ╠═797171d2-4083-4e2c-9cb2-930f2367ab1f
