package ar.edu.unsam.Grupo2

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List


@Accessors
class Mail {
	
	Jugador from
	var List<Jugador> to
	String message
	String title

	override equals(Object o) {
		try {
			val Mail otro = o as Mail
			return otro.message.equals(message)
		} catch (ClassCastException e) {
			return false
		}
	}
	
	override hashCode() {
		message.hashCode
	}
	
}