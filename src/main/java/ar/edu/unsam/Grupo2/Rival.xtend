package ar.edu.unsam.Grupo2

import org.uqbar.geodds.Point
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Rival extends Jugador {
	
	Pokemon pokemonRival
	int experiencia
	int apuesta
	
	
	new(TipoDeEntrenador _tipoDeEntrenador, Point _ubicacion,Pokemon _pokemon, int unaExperiencia, int _apuesta) {
		super(_tipoDeEntrenador, _ubicacion)
		pokemonRival=_pokemon
		experiencia = unaExperiencia
		apuesta= _apuesta
		
	}
	
	
	
}