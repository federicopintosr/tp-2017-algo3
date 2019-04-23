package ar.edu.unsam.Grupo2

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import com.eclipsesource.json.JsonArray
import com.eclipsesource.json.JsonValue
import com.eclipsesource.json.JsonObject

@Accessors
class ImportadorJsonEspecie {
	var List<Especie> listaDeEspeciesJson = newArrayList

	new() {
	}

	def List<Especie> creaListaEspecies(JsonArray _jsonRecibido, RepositorioEspecie repositorioEspecie) {


		_jsonRecibido.forEach [ jsonObject |
			listaDeEspeciesJson.add(this.convertirAEspecie(jsonObject.asObject(), repositorioEspecie))
		]

		listaDeEspeciesJson
	}

	def Especie convertirAEspecie(JsonObject _jsonObject, RepositorioEspecie repositorioEspecie) {

		var Especie especie

		especie = new Especie() => [

			setNumero(_jsonObject.get("numero").asInt())
			setNombre(_jsonObject.get("nombre").asString())
			setPuntosAtaqueBase(_jsonObject.get("puntosAtaqueBase").asInt())
			setPuntosSaludBase(_jsonObject.get("puntosSaludBase").asInt())
			setDescripcion(_jsonObject.get("descripcion").asString())
			setTipos(this.validaTipos(_jsonObject, repositorioEspecie))
			setVelocidad(_jsonObject.get("velocidad").asInt())
			setNivelParaEvolucion(_jsonObject.get("nivelEvolucion").asInt())
			setNumeroEspecieEvolucion(_jsonObject.get("nivelEvolucion").asInt())
		]

		return especie

	}

	def List<Tipo> validaTipos(JsonObject _jsonObject, RepositorioEspecie repositorioEspecie) {

		var JsonArray tiposObtenidos = _jsonObject.get("tipos").asArray()
		var List<String> nombresTipos = newArrayList

		for (JsonValue jsonObject : tiposObtenidos) {
			nombresTipos.add(jsonObject.asString())
		}

		this.convierteTipos(nombresTipos, repositorioEspecie)
	}

	def List<Tipo> convierteTipos(List<String> _nombresTipos, RepositorioEspecie repositorioEspecie) {
		repositorioEspecie.tiposDisponibles.filter[tipo|_nombresTipos.contains(tipo)].toList()

	}

	def convertidorDeJson(JsonArray _jsonRecibido, RepositorioEspecie repositorioEspecie) {
		return this.creaListaEspecies(_jsonRecibido, repositorioEspecie)
	}

}
