 class EntrenadorService {
    constructor($http) {
        this.$http = $http
    }

    findAll(callback) {
        this.$http.get('http://localhost:9000/entrenadores').then(callback)
    }
    atrapar(pokemon,indexPokeBola, callback){
        this.$http.put('http://localhost:9000/atrapar/' + pokemon.id,indexPokeBola).then(callback)
    }
    combatir(indexPokemon,rival,apuesta, callback){
        this.$http.put('http://localhost:9000/combatir/' + indexPokemon,rival.id,apuesta).then(callback)
    }

    moverAlNorte(callback){
        this.$http.put('http://localhost:9000/moversealnorte').then(callback)
    }

    moverAlSur(callback){
        this.$http.put('http://localhost:9000/moversealsur').then(callback)
    }

    moverAlEste(callback){
        this.$http.put('http://localhost:9000/moversealeste').then(callback)
    }

    moverAlOeste(callback){
        this.$http.put('http://localhost:9000/moversealoeste').then(callback)
    }
}
