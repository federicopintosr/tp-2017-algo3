package ar.edu.unsam.Grupo2

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class ProcesoCompuesto extends Proceso {
	
	
	List<Proceso> listaDeProcesos = newArrayList
	
	new(){}
	new (List<Proceso> unaListaDeProcesos){
		listaDeProcesos = unaListaDeProcesos
	}
	
	
	
	override activar(){
		listaDeProcesos.forEach[proceso | proceso.activar()]
		super.activar
	}
	
	def agregarProceso(Proceso _proceso){
		listaDeProcesos.add(_proceso)
	}
	
	def removerProceso(Proceso _proceso){
		listaDeProcesos.remove(_proceso)
	}
	
	
	
	
}