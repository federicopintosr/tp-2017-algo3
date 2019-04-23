package ar.edu.unsam.Grupo2



class PocionMaxima extends Mezcla {
	
	new(int _valor){
		this.valor=_valor
	}
	
	
	
	override curar(Pokemon unPokemon){		
		unPokemon.inicializaSalud()		
	}
	
}