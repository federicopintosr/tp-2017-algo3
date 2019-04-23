const atraparPokemon = {
        bindings: {
            atrapar: "&",
            pokemon: "<"
        },
        controllerAs: "atraparPokemonController",
        controller: class PokemonesUsuariosController {
            constructor(entrenadorService) {
                this.pokebolaSeleccionada = null
                this.inventario = []
                this.getEntrenadores()

            }
            
                    transformarAPokebola(jsonPokebola) {
                        return Pokebola.asPokebola(jsonPokebola)
                      }

            getEntrenadores() {
                this.entrenadorService.findAll((response) => {
                  this.entrenadores = this.transformarAEntrenador(response.data) 
                  this.inventario = _.map(response.data.pokebolas,this.transformarAPokebola)    
                  
                })
        }
    },
    templateUrl: '/partials/atraparPokemon.html'
}