angular
        .module('pokemonApp', ['ui.router'])
        .service('entrenadorService', EntrenadorService)
        .service('pokemonSalvajeService', PokemonSalvajeService)
        .service('pokeparadaService', PokeparadaService)
        .service('oponenteService', OponenteService)
        .component('atraparPokemon', atraparPokemon)
        .controller('entrenadorController', EntrenadorController)
        .controller('mundoController', MundoController)
        .config(routes)
            