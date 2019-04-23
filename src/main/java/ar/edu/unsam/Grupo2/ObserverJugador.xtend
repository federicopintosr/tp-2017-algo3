package ar.edu.unsam.Grupo2

import org.eclipse.xtend.lib.annotations.Accessors

//import java.util.List

@Accessors
class ObserverJugador {
	
	NotificaXNivelMaximo notiMax = new NotificaXNivelMaximo
	NotificarXMultiplo notiMult = new NotificarXMultiplo
	
		
	def ejecutarAcciones(Jugador unJugador){		
		unJugador.acciones.forEach[accion | accion.ejecutar(unJugador)]		
	}
	
	def observaYNotifica(Jugador unJugador){
		notiMax.notificaXNivelMaximo(unJugador) 
		notiMult.notificaXMultiploAlcanzado(unJugador)

	}
	

	
		

}