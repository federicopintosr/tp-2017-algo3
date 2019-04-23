package ar.edu.unsam.Grupo2

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Ingrediente extends Mezcla {
	double precio
	double adicional
	Mezcla decorado
	Pocion unaPocion
	
	new(double _precio, double _adicional){
		precio=_precio
		adicional=_adicional
	}
	
	new(Mezcla mezcla) {
		decorado = mezcla
	}	
	


}