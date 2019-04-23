package ar.edu.unsam.Grupo2

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RepositorioJugador extends Repositorio<Jugador> {

	static RepositorioJugador instance
	var List<Jugador> jugadores = newArrayList

	private new() {
	}

	def static getInstance() {
		if (instance === null) {
			instance = new RepositorioJugador
		}
		instance
	}


	new(List<Jugador> losJugadores) {
		jugadores = losJugadores
	}

	def getEntrenador(){ // condicion de que sea entrenador
		elementos.findFirst[jugador | jugador.npc == false]
	}
	
	def getRival(){
		elementos.findFirst[jugador | jugador.npc == true]
	}
	
	
	override esValida() {
		true
	}
	
	override validacion(String valor) {
	true
	}
	
	override actualizarElemento(Jugador _elemento, Jugador _otroElemento) {
		
	}
	
	def List<Jugador> getOponentesCercanos(){
		val entrenadorActivo = RepositorioJugador.getInstance().getEntrenador()
		elementos.filter[entrenador | entrenador.npc && entrenadorActivo.puedeAtacar(entrenador)].toList()
	}
	

}
