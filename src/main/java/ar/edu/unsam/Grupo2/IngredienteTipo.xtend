package ar.edu.unsam.Grupo2

class IngredienteTipo extends Ingrediente{
	
	Tipo unTipo
	double porcentajeTipo
	
	new(Mezcla decorado) {
		super(decorado)
	}
	
	new(double _precio, double _adicional, Tipo tipo, double _porcentajeTipo){
		super (_precio,_adicional)
		unTipo= tipo
		porcentajeTipo = _porcentajeTipo
	}
	
	override curar(Pokemon unPokemon){		
		if(unPokemon.especie.tipos.contains(unTipo)){
			decorado.curar(unPokemon)+ (decorado.curar(unPokemon) * porcentajeTipo)
		} else decorado.curar(unPokemon)+ (decorado.curar(unPokemon) * adicional)		
	}
	

	
}