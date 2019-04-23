package ar.edu.unsam.Grupo2

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.CollectionBasedRepo

@Accessors
class RepositorioPokemon extends Repositorio<Pokemon>  {
	
	static RepositorioPokemon instance
	var List<Pokemon> pokemones = newArrayList

	private new() {
	}

	def static getInstance() {
		if (instance === null) {
			instance = new RepositorioPokemon
		}
		instance
	}
	
	new(List<Pokemon> _pokemones) {
		pokemones = _pokemones
	}
	
	override actualizarElemento(Pokemon _elemento, Pokemon _otroElemento) {
	}
	
	override esValida() {
		true
	}
	
	override validacion(String valor) {
		true
	}
	
	

	
	




}
	
