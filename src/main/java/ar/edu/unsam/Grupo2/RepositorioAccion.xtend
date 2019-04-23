package ar.edu.unsam.Grupo2

import ar.edu.unsam.Grupo2.Accion
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable


@Accessors
@Observable
class RepositorioAccion {

	static RepositorioAccion instance

	private new() {
	}

	def static getInstance() {
		if (instance === null) {
			instance = new RepositorioAccion
		}
		instance
	}

	var List<Accion> acciones = newArrayList

	new(List<Accion> lasAcciones) {
		acciones = lasAcciones
	}

	def create(Accion _unElemento) {
		acciones.add(_unElemento)
	}

	def delete(Accion _elemento) {
		acciones.remove(_elemento)
	}

}
