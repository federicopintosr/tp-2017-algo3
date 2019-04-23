package ar.edu.unsam.Grupo2

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class ProcesoQuitarAcciones extends Proceso {

	List<Jugador> jugadores = newArrayList
	Accion accion
	List<Accion> acciones = newArrayList

	new() {
	}

	new(List<Jugador> _listaRepo, Accion unaAccion) {

		jugadores = _listaRepo
		accion = unaAccion
	}

	override activar() {
		jugadores.forEach(jugador|jugador.acciones.remove(accion))
		super.activar
	}


	def agregarAccion(Accion _accion) {
		acciones.add(_accion)
	}

	def removerAccion(Accion _accion) {
		acciones.remove(_accion)
	}

}
