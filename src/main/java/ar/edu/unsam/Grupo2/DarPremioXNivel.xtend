package ar.edu.unsam.Grupo2

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class DarPremioXNivel extends Accion{
	
	double montoRecompenza = 100
	
	Pocion pocionPremio
	
	int nivel

new (int unNivel, Pocion unaPocion){	
	pocionPremio = unaPocion
	nivel = unNivel
}
	
	new() {}
	
	override ejecutar(Jugador unJugador){
		this.darPremioPorNivel(unJugador)
	}
	
	
	def darPremioPorNivel(Jugador unJugador){
		if (unJugador.nivel==1){
			unJugador.dinero = unJugador.dinero + montoRecompenza
			unJugador.agregarPocion(pocionPremio)
		}
	}
	
}