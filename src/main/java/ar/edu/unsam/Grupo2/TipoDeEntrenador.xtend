package ar.edu.unsam.Grupo2

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
 abstract class TipoDeEntrenador {	
	double chancesPorSerExperto = 1.50
	
	def boolean esExperto(Jugador unJugador)
	def void sumaExperienciaAdicional(Jugador unJugador, Rival unRival)
	
	def chancesDeAtraparPoke(Jugador unJugador) {
		if (this.esExperto(unJugador))
			 chancesPorSerExperto				
		else 
			1.00 }
			
		
	}
	
			
@Accessors
class Luchador extends TipoDeEntrenador {
	int adicionalExperiencia = 200
	String nombre = "Luchador"
	
	override esExperto(Jugador unJugador) {
		   (unJugador.nivel >18) || (unJugador.combatesGanados > 30)
		   }
					
	override sumaExperienciaAdicional(Jugador unJugador, Rival unRival) {
			if(unRival.nivel > unJugador.getNivel()) {
						unJugador.experiencia = unJugador.experiencia + adicionalExperiencia
					}
					
		}
		
		
		}
		
@Accessors
class Colleccionista extends TipoDeEntrenador {
	String nombre = "Coleccionista"
	
	override esExperto(Jugador unJugador) {
		(unJugador.nivel > 13) && unJugador.cantidadEspeciesAtrapadas() > 20 && 
		unJugador.tieneColeccionBalanceada 

	}
	
	override sumaExperienciaAdicional(Jugador unJugador, Rival unRival) {}
	
	
}


@Accessors
class Criador extends TipoDeEntrenador {
	
	String nombre = "Criador"
	
	override esExperto(Jugador unJugador) {
		unJugador.cantidadPokemonesConMasDeNivel20 >5 && unJugador.pokemonesQueEvolucione >= 15 }
	
	override sumaExperienciaAdicional(Jugador unJugador, Rival unRival) {}
	
	
	
				}
