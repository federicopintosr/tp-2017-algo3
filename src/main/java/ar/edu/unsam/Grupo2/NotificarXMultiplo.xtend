package ar.edu.unsam.Grupo2

class NotificarXMultiplo extends Accion{
	
	override ejecutar(Jugador unJugador) {
			this.notificaXMultiploAlcanzado(unJugador)
	}
	
	def notificaXMultiploAlcanzado(Jugador unJugador){
		if (0 ==  unJugador.getNivel % unJugador.multiplo){
			unJugador.recibirNoti("Alcanze nivel multiplo de 5")
			unJugador.amigosActivos.forEach[amigos|unJugador.recibirNoti("Alcanze nivel multiplo de 5")]
			
		}
	}
	
	
	
	
}