class Pokemon {
    // Atributos
    constructor(_nombre, _experiencia, _especie, _tipo, _sexo) {
        this.nombre = _nombre
        this.experiencia = _experiencia
        this.especie = _especie
        this.tipo = _tipo
        this.sexo = _sexo
        this.salud
    }

    

    getNivel() {
        return parseInt((Math.sqrt(100 * (2 * this.experiencia + 25)) + 50) / 100)
    }

    getPuntosDeAtaque() {
        return this.getNivel() * this.especie.getPuntosAtaqueBase()
    }

    chancesFuerte(pokemon) {
        if (this.esFuerte(pokemon)) {
            return this.getPuntosDeAtaque() * 0.25
        }
        return 0
    }

    chancesResistente(pokemon) {
        if (this.soyFuerteContra(pokemon)) {
            return this.getPuntosDeAtaque() * 0.15
        }
        return 0
    }

    getAdicionalPorEntrenadorExperto() {
        if (this.entrenador.esExperto()) {
            return this.getPuntosDeAtaque() * 0.20
        }
        return 0
    }

    esDeTipo(tipo) {
        return this.tipos.indexOf(tipo) >= 0
    }

    soyFuerteContra(pokemon) {
        return this.especie.esFuerte(pokemon.especie)
    }

    soyResistenteContra(pokemon) {
        return this.especie.esResistente(pokemon.especie)
    }

    chancesDeEscapar() {
        return this.getNivel() * (1 + this.especie.getVelocidad() / 10)
    }

    getPuntosDeSaludMaxima() {
        return this.getNivel() * this.especie.puntosSaludBase
    }

    getPorcentajeSalud() {
        return (this.salud / this.getPuntosDeSaludMaxima()) * 100
    }

    static asPokemon(jsonPokemon) {
        return angular.extend(new Pokemon(), jsonPokemon)
     }

}