class MundoController {
  constructor(pokemonSalvajeService, pokeparadaService, oponenteService, entrenadorService) {
    this.pokemonSalvajeService = pokemonSalvajeService
    this.entrenadorService = entrenadorService
    this.pokeparadaService = pokeparadaService
    this.oponenteService = oponenteService
    this.pokemonesSalvajes = []
    this.pokeparadasCercanas = []
    this.oponentesCercanos = []
    this.pokemon = []
    this.getPokemones()
    this.getOponentes()
    this.getPokeparadas()
    this.getEntrenadores()
    this.pokemonSalvajeSeleccionado
    this.rivalSeleccionado
    this.pokebolaElegida
    this.pokemonElegido
    this.alerta=false
    this.alertaAtrapar=false
    this.apuestaR
  }


  transformarAEntrenador(jsonEntrenador) {
    return Entrenador.asEntrenador(jsonEntrenador)
  }

  transformarAPokemon(jsonPokemon) {
    return Pokemon.asPokemon(jsonPokemon)
  }

  transformarAPokeparada(jsonPokeparada) {
    return Pokeparada.asPokeparada(jsonPokeparada)
  }
  transformarAPocion(jsonPocion) {
    return Pocion.asPocion(jsonPocion)
  }

  getEntrenadores() {
    this.entrenadorService.findAll((response) => {
      this.entrenadores = this.transformarAEntrenador(response.data)
      this.pokemones = _.map(response.data.equipo, this.transformarAPokemon)
      this.deposito = _.map(response.data.deposito, this.transformarAPokemon)
      this.pokebolas = _.map(response.data.pokebolas, this.transformarAPokebola)
      this.pociones = _.map(response.data.pociones, this.transformarAPocion)

    })
  }

  getPokemones() {
    this.pokemonSalvajeService.findAll((response) => {
      this.pokemonesSalvajes = _.map(response.data, this.transformarAPokemon)
    })
  }

  getOponentes() {
    this.oponenteService.findAll((response) => {
      this.oponentesCercanos = _.map(response.data, this.transformarAEntrenador)
      this.pokemon = this.transformarAPokemon(response.data.pokemonRival)
    })
  }

  getPokeparadas() {
    this.pokeparadaService.findAll((response) => {
      this.pokeparadasCercanas = _.map(response.data, this.transformarAPokeparada)
    })
  }
  seleccionarPokemonSalvaje(_pokemon) {
    this.pokemonSalvajeSeleccionado = _pokemon
  }

  seleccionarRival(_rival){
    this.rivalSeleccionado = _rival
  }

  apuesta(_apuesta){
    this.apuestaR = _apuesta
  }



  curarEquipo(pokeparada) {
    this.alerta=true
    this.pokeparadaService.curarEquipo(pokeparada,
      () => {})
  }

  atrapar(pokemon,pokeBola){
    this.entrenadorService.atrapar(pokemon,this.pokebolas.indexOf(pokeBola), 
    () => {this.getPokemones()
    this.getEntrenadores()
    this.pokebolaElegida=null
  this.alertaAtrapar=true})
  }

  combatir(pokemon,rival,apuesta){
    this.entrenadorService.combatir(this.pokemones.indexOf(pokemon),rival,apuesta,
    () => {this.getPokemones()
    this.getEntrenadores()
    this.getOponentes()
    this.pokemonElegido=null
  this.alertaAtrapar=true})
  }
  // ------------------------- MOVIMIENTOS ---------------------------------------------


  moverAlNorte() {
    this.entrenadorService.moverAlNorte(() => {
      this.getPokeparadas()
      this.getPokemones()
      this.getOponentes()
      this.entrenadores = this.getEntrenadores()
    })
  }

  moverAlSur() {
    this.entrenadorService.moverAlSur(() => {
      this.getPokeparadas()
      this.getPokemones()
      this.getOponentes()
      this.entrenadores = this.getEntrenadores()
    })
  }

  moverAlOeste() {
    this.entrenadorService.moverAlOeste(() => {
      this.getPokeparadas()
      this.getPokemones()
      this.getOponentes()
      this.entrenadores = this.getEntrenadores()
    })
  }

  moverAlEste() {
    this.entrenadorService.moverAlEste(() => {
      this.getPokeparadas()
      this.getPokemones()
      this.getOponentes()
      this.entrenadores = this.getEntrenadores()
    })
  }


}