package ar.edu.unsam.Grupo2

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class RepositorioProceso extends Repositorio<Proceso> {
	
	 
	int id=1
	static RepositorioProceso instance

	private new() {
	}

	def static getInstance() {
		if (instance === null) {
			instance = new RepositorioProceso
		}
		instance
	}

	
	override actualizarElemento(Proceso _elemento, Proceso _otroElemento) {
		
	}
	
override esValida() { true }

override validacion(String valor) { true }




}
