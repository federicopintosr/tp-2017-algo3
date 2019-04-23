package ar.edu.unsam.Grupo2

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class ProcesoAgregarAcciones extends Proceso{
	
	List<Jugador> jugadores= newArrayList
	Accion accion
	List<Accion> acciones = newArrayList
	
	new(){}
	
	new(List<Jugador> _listaRepo,List<Accion> _acciones){
		
		jugadores = _listaRepo
		acciones = _acciones
	}
	
	new(List<Jugador> _listaRepo, Accion _unaAccion){
		jugadores = _listaRepo		
		accion = _unaAccion
	}
	
	def agregarAccion(Accion _accion){
		acciones.add(_accion)
		
	}
	
	def removerAccion(Accion _accion){
		acciones.remove(_accion)
	}
	
	override activar(){
		 jugadores.forEach(jugador | jugador.acciones.add(accion))
		 super.activar()
	}
	
	def update(ProcesoAgregarAcciones _proceso) {
		accion = _proceso.accion
		return this
	}
	
	
}