class EntrenadorController {
  constructor(entrenadorService) {
    this.entrenadorService = entrenadorService
    this.entrenadores = []
    this.pokemones = []
    this.deposito = []
    this.pokebolas = []
    this.pociones = []
    this.getEntrenadores()
    this.pokemonSeleccionado

}


transformarAEntrenador(jsonEntrenador) {
  return Entrenador.asEntrenador(jsonEntrenador)
}

transformarAPokemon(jsonPokemon) {
  return Pokemon.asPokemon(jsonPokemon)
}

transformarAPokebola(jsonPokebola) {
  return Pokebola.asPokebola(jsonPokebola)
}
transformarAPocion(jsonPocion) {
  return Pocion.asPocion(jsonPocion)
}

// TRAER LOS POKEMONES
getEntrenadores() {
  this.entrenadorService.findAll((response) => {
    this.entrenadores = this.transformarAEntrenador(response.data) 
    this.pokemones = _.map(response.data.equipo,this.transformarAPokemon)
    this.deposito = _.map(response.data.deposito,this.transformarAPokemon)
    this.pokebolas = _.map(response.data.pokebolas,this.transformarAPokebola)    
    this.pociones = _.map(response.data.pociones,this.transformarAPocion)
    
  })
}
cantidadDePokebolas(){
  return this.pokebolas.size()
}

seleccionarPokemon(_pokemon){
  this.pokemonSeleccionado = _pokemon
}



}



  
  /*constructor(){
        this.pokemones=[new Pokemon("PikaPika",20, new Especie("Pikachu"),new Tipo("Electrico"),"Macho"),new Pokemon("Charmy",500,new Especie("Charmander"),new Tipo("Fuego"),"Hembra"),new Pokemon("Ilusion",5000, new Especie("Abra"),new Tipo("Psiquico"),"Macho")]
        this.pokemonSeleccionado
        this.pokebolas=[new Pokebola("Pokebola",20),new Pokebola("Ultrabola",2)]
        this.pociones=[new Pocion("Pocion",4)]
        this.entrenador=new Entrenador("Lucho Targaryen",550,3500,"Coleccionista")
      }
    
      seleccionarPokemon(_pokemon){
        this.pokemonSeleccionado = _pokemon
      }
    }
    */