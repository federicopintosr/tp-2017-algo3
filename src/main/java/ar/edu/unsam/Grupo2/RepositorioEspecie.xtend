package ar.edu.unsam.Grupo2

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import com.eclipsesource.json.JsonArray
import ar.edu.unsam.exceptions.BusinessException
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class RepositorioEspecie extends Repositorio<Especie> {
	var List<Especie> listaJson

	ImportadorJsonEspecie importador = new ImportadorJsonEspecie()

	int id = 1


	var List<Especie> especies = newArrayList
	var List<Tipo> tiposDisponibles = newArrayList

	static RepositorioEspecie instance

	private new() {
	}

	def static getInstance() {
		if (instance === null) {
			instance = new RepositorioEspecie
		}
		instance
	}
	
	new(List<Especie> _especies) {
		especies = _especies
	}

///////////////////////////////////////////////// JSON ///////////////////////////////////////
	def agregarTipos(Tipo unTipo) {
		tiposDisponibles.add(unTipo)

	}

	def void importarDesdeJSON(JsonArray _jsonRecibido) {

		listaJson = importador.convertidorDeJson(_jsonRecibido, this)

	}

	override updateAll() {
		if (listaJson === null) {
			throw new BusinessException("La Lista esta vacia")
		}

		listaJson.forEach[especie|this.buscarElementoXNumero(especie).update(especie)]

	}

	def buscarElementoXNumero(Especie _especie) {
		var Especie especieActualizada
		especieActualizada = elementos.findFirst[especie|especie.validarNumero(_especie.numero.toString)]
		if (especieActualizada === null) {
			throw new BusinessException("No existe el elemento en el repositorio")
		} else
			especieActualizada

	}

	override actualizarElemento(Especie _elemento, Especie _otroElemento) {
		_elemento.update(_otroElemento)
	}
	
	override esValida() { true }

	override validacion(String valor) { true }

}
