package ar.edu.unsam.Grupo2

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.Entity

@Accessors
@TransactionalAndObservable
abstract class Accion extends Entity {
	
	
	String descripcion 
	
	def void ejecutar(Jugador unJugador)

	
}