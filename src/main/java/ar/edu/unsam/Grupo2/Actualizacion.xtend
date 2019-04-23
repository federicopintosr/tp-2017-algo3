package ar.edu.unsam.Grupo2

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Actualizacion extends Proceso {
	
	List<Repositorio> reposRepo= newArrayList
	
	new(){}
	
	new(List<Repositorio> _listaRepo){
		
		reposRepo = _listaRepo
	}
	
	override activar(){
		 reposRepo.forEach(repo | repo.updateAll())
		 super.activar
	}
	
	def agregarRepositorio(Repositorio _repositorio){
		reposRepo.add(_repositorio)
	}
	
	def removerRepositorio(Repositorio _repositorio){
		reposRepo.remove(_repositorio)
	}
}