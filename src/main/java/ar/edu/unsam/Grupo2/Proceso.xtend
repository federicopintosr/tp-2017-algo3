package ar.edu.unsam.Grupo2

import java.time.LocalDateTime
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
 abstract class Proceso implements ERepositorios {
	
	String descripcion
	LocalDateTime ultimaEjecucion

	new(){}
	int id=0
	
	
	
	
	def isNew(){
		id==0
	}

	//TODO: Template method
	def void activar(){
		ultimaEjecucion = LocalDateTime.now()
		//doActivar()
	}
	
	//def void doActivar()
	
	override esValida() {
	return true
	}
	
	override validacion(String valor) {
		return true
	}
	
	
	
  
	
	
	
	
	
}