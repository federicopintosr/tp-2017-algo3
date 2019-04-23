package ar.edu.unsam.Grupo2

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepositorioRival extends Repositorio<Rival> {

	static RepositorioRival instance
	var List<Rival> rivales = newArrayList

	private new() {
	}

	def static getInstance() {
		if (instance === null) {
			instance = new RepositorioRival
		}
		instance
	}
	
	def getOponente(){
		elementos.findFirst[jugador | jugador.npc == true]
	}
	
	def List<Rival> getRival(){
		val entrenadorActivo = RepositorioJugador.getInstance().getEntrenador()
		elementos.filter[entrenador | entrenador.npc && entrenadorActivo.puedeAtacar(entrenador)].toList()
	}


	new(List<Rival> losJugadores) {
		rivales = losJugadores
	}	
	
	override esValida() {
		true
	}
	
	override validacion(String valor) {
	true
	}
	
	override actualizarElemento(Rival _elemento, Rival _otroElemento) {
	
	}
	
	

	
	

}
