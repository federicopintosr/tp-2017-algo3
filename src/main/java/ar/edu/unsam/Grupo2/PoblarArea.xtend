package ar.edu.unsam.Grupo2

import java.util.List
import org.uqbar.commons.model.annotations.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
class PoblarArea extends Proceso {
	
RepositorioPokemon repositorioPokemon
List<Especie> especies = newArrayList
AreaRectangular area
double densidad
Randoms randoms
int nivelMinimo=0
int nivelMaximo=0


new(){}

new(RepositorioPokemon _repositorioPokemon,List<Especie> _especies, AreaRectangular _area, double _densidad){
		
		repositorioPokemon = _repositorioPokemon
		especies = _especies
		area = _area
		densidad = _densidad

	}
	
	def cantidadDePokemonesEnArea(AreaRectangular area){
		 (area.calcularArea() * densidad).intValue()
	}
	
	def agregarEspecie(Especie _especie){
		especies.add(_especie)
	}
	
	def removerEspecie(Especie _especie){
		especies.remove(_especie)
	}
	
	
	
	override activar() {
//		(1 .. cantidadDePokemonesEnArea(area)).forEach [ repositorioPokemon.create(new Pokemon(randoms.getExperienciaPokemonRandom(nivelMinimo,nivelMaximo),randoms.getEspecieRandom(especies),randoms.getPuntoRandomEnElArea(area), "m"))]
		super.activar
	}
	

	
	
}