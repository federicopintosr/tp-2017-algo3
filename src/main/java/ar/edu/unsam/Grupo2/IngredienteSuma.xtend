package ar.edu.unsam.Grupo2

class IngredienteSuma extends Ingrediente {
	
	new(Mezcla decorado) {
		super(decorado)
	}
	
		new(double _precio, double _adicional){
		super (_precio,_adicional)
	}
	

	
	override curar(Pokemon unPokemon){
		(decorado.curar(unPokemon) + adicional) 
	}
	
}