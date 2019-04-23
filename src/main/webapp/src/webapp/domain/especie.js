class Especie {
	constructor(_nombre, _puntosAtaqueBase, _puntosSaludBase, _tipos, _velocidad) {

		this.nombre = _nombre
		this.puntosAtaqueBase = _puntosAtaqueBase
		this.puntosSaludBase = _puntosSaludBase
		this.tipos = _tipos
		this.velocidad = _velocidad
	}
	getPuntosAtaqueBase() {
		return this.puntosAtaqueBase
	}

	esDeTipo(tipo) {
		return this.tipos.indexOf(tipo) >= 0
	}

	esFuerte(especie) {
		var tiposFuertes = this.tipos.map(tipo => tipo.fortalezas)
		var tiposFuertesFlat = [].concat.apply([], tiposFuertes)
		return tiposFuertesFlat.some(tipo => especie.esDeTipo(tipo))
	}

	esResistente(especie) {
		var tiposResistentes = this.tipos.map(tipo => tipo.resistencias)
		var tiposResistentesFlat = [].concat.apply([], tiposResistentes)
		return tiposResistentesFlat.some(tipo => especie.esDeTipo(tipo))
	}

	getVelocidad() {
		return this.velocidad
	}


}