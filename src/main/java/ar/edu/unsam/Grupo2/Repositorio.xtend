package ar.edu.unsam.Grupo2

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import ar.edu.unsam.exceptions.BusinessException
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
abstract class Repositorio <T extends ERepositorios> implements ERepositorios{
	int id = 1
	
	var List<T> elementos = newArrayList
	String descripcion
	
	def create(T _unElemento) {
		if (_unElemento.esValida) {
			elementos.add(_unElemento)
			_unElemento.setId(id)
			this.incrementarId
		}
	}
	
	def incrementarId() {
		id += 1
	}
	
	def delete(T _elemento) {
		elementos.remove(_elemento)
	}
	
	def update(T _elemento, T _otroElemento) {
		var T elemento
		if (!elementos.contains(_elemento)) {
			throw new BusinessException("No existe el elemento en el repositorio")
		}		
		if (_elemento.esValida) {
			elemento=this.searchById(_elemento.getId())
			this.actualizarElemento(elemento,_otroElemento)
		}

	}
	
	def void updateAll(){}

	def searchById(int _id) {
		elementos.findFirst[elemento|elemento.id == _id]

	}

	def search(String valorCorto) {
		elementos.filter[elemento|elemento.validacion(valorCorto)].toList

	}
	
	abstract def void actualizarElemento(T _elemento, T _otroElemento)	
	
}