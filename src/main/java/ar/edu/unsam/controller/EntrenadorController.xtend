package ar.edu.unsam.controller

import ar.edu.unsam.Grupo2.RepositorioJugador
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.unsam.Grupo2.RepositorioPokemon
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.api.XTRest
import ar.edu.unsam.runneable.PokemonBootstrap

@Controller
class EntrenadorController {

	extension JSONUtils = new JSONUtils
	
	@Get("/pokemonesSalvajes")
	def Result pokemonesSalvajes() {
		val pokemonesSalvajes = RepositorioPokemon.instance.elementos
		response.contentType = ContentType.APPLICATION_JSON
		ok(pokemonesSalvajes.toJson)
	}

	@Get("/entrenadores")
	def Result entrenadorActivo(){
		val entrenadores = RepositorioJugador.instance.getEntrenador()
		response.contentType = ContentType.APPLICATION_JSON
		ok(entrenadores.toJson)
	}

	def static void main(String[] args) {
		new PokemonBootstrap().run()
		XTRest.start(9000, EntrenadorController, MundoController)
	}
	
}