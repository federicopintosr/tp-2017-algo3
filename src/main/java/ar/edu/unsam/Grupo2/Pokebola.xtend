package ar.edu.unsam.Grupo2

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors

class Pokebola extends Item{
	
	double chances
	var int cantidad
	
	new(){}
	
	new(int _valor, double _chances, String _nombre){
		this.valor=_valor
		chances=_chances
		this.nombre =_nombre
	}
	
	
	
}

