package ar.edu.unsam.Grupo2

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Tipo {
	
	
	String nombre
	var List<Tipo> fuertes = newArrayList
	var List<Tipo> resistentes = newArrayList

	new(List<Tipo> _fuertes,List<Tipo> _resistentes){
		fuertes =_fuertes
		resistentes=_resistentes
	}

	def setNombre(String _nombre){
		nombre = _nombre
	}

}