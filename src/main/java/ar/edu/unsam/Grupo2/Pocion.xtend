package ar.edu.unsam.Grupo2

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
 class Pocion extends Mezcla {
	 
	int curar
	 
	 
	new(){
		
	}	 
	
	new(int _valor, int _curar, String _nombre){
		this.valor=_valor
		curar=_curar
		nombre = _nombre
	}
	
	override curar(Pokemon unPokemon){
		curar
	}
	

	
	}