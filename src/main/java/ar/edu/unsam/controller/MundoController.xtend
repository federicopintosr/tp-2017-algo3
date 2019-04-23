package ar.edu.unsam.controller

import ar.edu.unsam.Grupo2.Pokebola
import ar.edu.unsam.Grupo2.Pokemon
import ar.edu.unsam.Grupo2.Pokeparada
import ar.edu.unsam.Grupo2.RepositorioJugador
import ar.edu.unsam.Grupo2.RepositorioPokeparada
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.unsam.Grupo2.Repositorio
import ar.edu.unsam.Grupo2.RepositorioPokemon
import ar.edu.unsam.Grupo2.RepositorioRival

@Controller
class MundoController {
	extension JSONUtils = new JSONUtils

	@Get("/oponentes")
	def Result oponentesCercanos() {
		val oponentes = RepositorioRival.getInstance().getRival()
		response.contentType = ContentType.APPLICATION_JSON
		ok(oponentes.toJson)
	}

	@Get("/pokeparadasCercanas")
	def Result pokeparadasCercanas() {
		val pokeparadas = RepositorioPokeparada.getInstance().elementos
		response.contentType = ContentType.APPLICATION_JSON
		ok(pokeparadas.toJson)
	}

	@Put("/curarequipo")
	def Result curarEquipo(@Body String body) {
		val pokeparada = body.fromJson(Pokeparada)
		var entrenadorActivo = RepositorioJugador.getInstance().getEntrenador()
		entrenadorActivo.curarEquipo(pokeparada)
		ok('{ "status" : "OK" }');
	}

	@Put("/atrapar/:id")
	def Result atrapar(@Body String body) {
	//def Result atrapar(String pokebola, String entrenador) {
		var entrenadorActivo = RepositorioJugador.getInstance().getEntrenador()
		val pokemon = RepositorioPokemon.instance.searchById(Integer.parseInt(id))
		//println(pokebola)
		val index = body.fromJson(int)
		val pokebolaSeleccionada2= entrenadorActivo.pokebolas.get(index)
		//val pokebolaSeleccionada = entrenadorActivo.pokebolas.get(0)
		//println(pokebolaSeleccionada)
		entrenadorActivo.atraparPokemon(pokemon, pokebolaSeleccionada2)
		ok('{ "status" : "OK" }');
	}
	
	@Put("/combatir/:id")
	def Result combatir(@Body String body) {
	//def Result atrapar(String pokebola, String entrenador) {
		var entrenadorActivo = RepositorioJugador.getInstance().getEntrenador()
		val index1 = body.fromJson(int)
		var rival = RepositorioRival.instance.searchById(Integer.parseInt(id))
		var apuestaR = rival.apuesta
		var miPokemon= entrenadorActivo.equipo.get(index1)
		//val pokemon = RepositorioPokemon.instance.searchById(Integer.parseInt(id))
		//val pokebolaSeleccionada = entrenadorActivo.pokebolas.get(0)
		//println(pokebolaSeleccionada)
		entrenadorActivo.combate(miPokemon,rival, apuestaR)
		ok('{ "status" : "OK" }');
	}

	@Put("/moversealnorte")
	def Result moverAlNorte(@Body String body) {
		val entrenadorActivo = RepositorioJugador.getInstance().getEntrenador()
		entrenadorActivo.irNorte()
		ok('{ "status" : "OK" }');
	}

	@Put("/moversealsur")
	def Result moverAlSur(@Body String body) {
		val entrenadorActivo = RepositorioJugador.getInstance().getEntrenador()
		entrenadorActivo.irSur()
		ok('{ "status" : "OK" }');
	}

	@Put("/moversealoeste")
	def Result moverAlOeste(@Body String body) {
		val entrenadorActivo = RepositorioJugador.getInstance().getEntrenador()
		entrenadorActivo.irOeste()
		ok('{ "status" : "OK" }');
	}

	@Put("/moversealeste")
	def Result moverAlEste(@Body String body) {
		val entrenadorActivo = RepositorioJugador.getInstance().getEntrenador()
		entrenadorActivo.irEste()
		ok('{ "status" : "OK" }');
	}

}
