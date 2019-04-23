package ar.edu.unsam.Grupo2

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class RepositorioArea  {
	

	static RepositorioArea instance

	private new() {
	}

	def static getInstance() {
		if (instance === null) {
			instance = new RepositorioArea
		}
		instance
	}

	var List<AreaRectangular> areas = newArrayList

	new(List<AreaRectangular> lasAreas) {
		areas = lasAreas
	}

	def create(AreaRectangular _unElemento) {
		areas.add(_unElemento)
	}

	def delete(AreaRectangular _elemento) {
		areas.remove(_elemento)
	}
	
//	override actualizarElemento(AreaRectangular _elemento, AreaRectangular _otroElemento) {
//	
//	}

}
