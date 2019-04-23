class Pokeparada{
    constructor(_nombre,_ubicacion){
        this.nombre= _nombre
        this.ubicacion= _ubicacion
    }

    static asPokeparada(jsonPokeparada) {
        return angular.extend(new Pokeparada(), jsonPokeparada)
     }

}