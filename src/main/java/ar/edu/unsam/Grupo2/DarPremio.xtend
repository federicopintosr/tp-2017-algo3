package ar.edu.unsam.Grupo2

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class DarPremio extends Accion{
	
	Pocion premio
	
	Pokebola pokebola
	
	
	new(Pocion unaPocion){
		premio = unaPocion
	}	
	new(Pokebola unaPokebola){
		pokebola = unaPokebola
	}
	
	
	override ejecutar(Jugador unJugador){		
	if (unJugador.nivel > 0){
	unJugador.agregarPocion(premio)	
	}
	
	}
	
}