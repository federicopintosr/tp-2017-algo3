package ar.edu.unsam.Grupo2

import java.util.List
import com.eclipsesource.json.JsonArray
import com.eclipsesource.json.JsonValue
import com.eclipsesource.json.JsonObject
import org.uqbar.geodds.Point

class ImportadorJsonPokeparada {
	
	
	 def List<Pokeparada> creaListaPokeparadas(JsonArray _jsonRecibido,RepositorioPokeparada repopokeparada) {
		var List<Pokeparada> listaDePokeparadasJson = newArrayList
		var Pokeparada pokeparadaJson

		for (JsonValue jsonObject : _jsonRecibido) {
			pokeparadaJson = this.convertirAPokeparada(jsonObject.asObject(),repopokeparada)
			listaDePokeparadasJson.add(pokeparadaJson)

		}
		listaDePokeparadasJson
	}

	def Pokeparada convertirAPokeparada(JsonObject _jsonObject,RepositorioPokeparada repoPokeparada) {

		var Pokeparada pokeparada

		pokeparada = new Pokeparada() => [

		
			setUbicacion(this.validaPunto(_jsonObject))
			setNombre(_jsonObject.get("nombre").asString())
			setNombre(_jsonObject.get("nombre").asString())
			setItemsDisponibles(this.validaItemsDisponibles(_jsonObject,repoPokeparada))

		]

		pokeparada

	}

	def validaPunto(JsonObject _jsonObject) {
		var Point unPunto
		unPunto = new Point((_jsonObject.get("x").asDouble()), (_jsonObject.get("y").asDouble()))
		return unPunto

	}

	def List<Item> validaItemsDisponibles(JsonObject _jsonObject,RepositorioPokeparada repoPokeparada) {

		var JsonArray itemsObtenidos = _jsonObject.get("itemsDisponibles").asArray()
		var List<String> nombresItems = newArrayList

		for (JsonValue jsonObject : itemsObtenidos) {
			nombresItems.add(jsonObject.asString())
		}

		this.convierteItems(nombresItems,repoPokeparada)
	}

	def List<Item> convierteItems(List<String> _nombresItems,RepositorioPokeparada repoPokeparada) {
		repoPokeparada.itemsDisponibles.filter[item|_nombresItems.contains(item)].toList()

	}

	def convertidorDeJson (JsonArray _jsonRecibido, RepositorioPokeparada repopokeparada){
		return this.creaListaPokeparadas(_jsonRecibido, repopokeparada)		
	}
	
}