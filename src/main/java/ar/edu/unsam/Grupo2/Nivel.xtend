package ar.edu.unsam.Grupo2

class Nivel {
	var mapa = #{0 -> 1, 1000 -> 2, 3000 -> 3, 6000 -> 4, 10000 -> 5, 15000 -> 6, 21000 -> 7, 28000 -> 8, 36000 -> 9,
		45000 -> 10, 55000 -> 11, 65000 -> 12, 75000 -> 13, 85000 -> 14, 100000 -> 15, 120000 -> 16, 140000 -> 17,
		160000 -> 18, 185000 -> 19, 210000 -> 20}

	def int getNivel(int unaExperiencia) {
		
		var setNiveles = mapa.keySet()
		var setExperiencia = setNiveles.filter(experiencia|experiencia <= unaExperiencia)
		var claveExperiencia = setExperiencia.max()
		mapa.get(claveExperiencia)
		
	}

}
