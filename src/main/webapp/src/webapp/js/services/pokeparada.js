class PokeparadaService {
    constructor($http) {
        this.$http = $http
    }

    findAll(callback) {
        this.$http.get('http://localhost:9000/pokeparadasCercanas').then(callback)
    }
    curarEquipo(pokeparada, callback){
        this.$http.put('http://localhost:9000/curarequipo', pokeparada).then(callback)
    }
}