package ar.edu.unsam.Grupo2

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import com.eclipsesource.json.JsonArray

@Accessors
class RepositorioPokeparada extends Repositorio<Pokeparada> {
	int id = 1
	static RepositorioPokeparada instance

	private new() {
	}

	def static getInstance() {
		if (instance === null) {
			instance = new RepositorioPokeparada
		}
		instance
	}

	ImportadorJsonPokeparada importador = new ImportadorJsonPokeparada()

	var List<Pokeparada> pokeparadas = newArrayList
	var List<Item> itemsDisponibles = newArrayList

	override actualizarElemento(Pokeparada _elemento, Pokeparada _otroElemento) {
		//_elemento.update(_otroElemento)
	}

	def agregarItems(Item unItem) {
		itemsDisponibles.add(unItem)

	}

	def void importarDesdeJSON(JsonArray _jsonRecibido) {
		val lista = importador.convertidorDeJson(_jsonRecibido, this)
		lista.forEach[pokeparada|this.update(this.buscarElementoXNombre(pokeparada), pokeparada)]
	}

	def buscarElementoXNombre(Pokeparada _pokeparada) {
		var Pokeparada pokeparadaActualizada
		pokeparadaActualizada = elementos.findFirst[pokeparada|pokeparada.validarNombre(_pokeparada.nombre)]
		pokeparadaActualizada

	}

	override esValida() { true }

	override validacion(String valor) { true }

}
