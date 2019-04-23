class PokemonSalvajeService {
    constructor($http) {
        this.$http = $http
    }

    findAll(callback) {
        this.$http.get('http://localhost:9000/pokemonesSalvajes').then(callback)
    }

}