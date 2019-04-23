package ar.edu.unsam.Grupo2

import java.util.List

class NotificaXSupereAmigo extends Accion{
	
	override ejecutar(Jugador unJugador) {
		this.notificaXSupereAmigo(unJugador)
	}
	
	def notificaXSupereAmigo(Jugador unJugador){
		val String notiSupere = "Te pase"
		var List<Jugador> amigosSuperados 
		amigosSuperados = unJugador.amigosActivos.filter[jugador | (jugador.nivel + 1) == unJugador.nivel].toList()	
		this.mandarMail(unJugador,amigosSuperados,notiSupere,notiSupere)
		
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