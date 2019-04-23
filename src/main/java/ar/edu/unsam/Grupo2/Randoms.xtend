package ar.edu.unsam.Grupo2

import org.uqbar.geodds.Point
import java.util.List

class Randoms {



	def Point getPuntoRandomEnElArea(AreaRectangular _area) {
		val coordenadaX = getDoubleRandomEnIntervalo(_area.getX1(), _area.getX2())
		val coordenadaY = getDoubleRandomEnIntervalo(_area.getY1(), _area.getY2())
		new Point(coordenadaX, coordenadaY)
	}

	def double getDoubleRandomEnIntervalo(double _min, double _max) {
		var double intervalo = Math.abs(_max - _min)
		(Math.random() * intervalo) + _min
	}

	def int getEnteroRandomEnIntervalo(int _min, int _max) {
		var int intervalo = Math.abs(_max - _min) + 1
		(Math.random() * intervalo).intValue + _min
	}

	def getEspecieRandom(List<Especie> especies) {
		val unaEspecieRandom = getEnteroRandomEnIntervalo(0, especies.size)
		especies.get(unaEspecieRandom)
	}
	
	def getExperienciaPokemonRandom(double nivelMinimo, double nivelMaximo){
		return getDoubleRandomEnIntervalo(nivelMinimo,nivelMaximo)
		
		
	}

}
