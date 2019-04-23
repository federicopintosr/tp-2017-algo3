package ar.edu.unsam.Grupo2

import java.util.List

class NotificaXNivelMaximo extends Accion{
	
		
	override ejecutar(Jugador unJugador) {
		this.notificaXNivelMaximo(unJugador)
	}		
		
	def notificaXNivelMaximo(Jugador unJugador){
		val String notiNivelMax = "Alcanze el nivel Maximo"
		if(unJugador.getNivel == 20){
			unJugador.recibirNoti(notiNivelMax)
			unJugador.amigosActivos.forEach[amigos|unJugador.recibirNoti(notiNivelMax)]	
			this.mandarMail(unJugador,unJugador.amigosActivos,notiNivelMax,notiNivelMax)
		}
	}
	
	def mandarMail(Jugador unJugador,List<Jugador> _destinatarios ,String _titulo,String _mensaje){	
	
	val mail = new Mail => [
				to = _destinatarios
				from = unJugador
				title = _titulo
				message = _mensaje				
			]
	ServiceLocator.instance.messageSender.send(mail)
		
			
	}
	
	
	
}