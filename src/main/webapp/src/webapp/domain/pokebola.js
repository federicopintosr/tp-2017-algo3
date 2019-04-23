class Pokebola{
    constructor(_nombre,_chances){
        this.nombre= _nombre
        this.chances=_chances
        this.cantidad
    }

    getCantidad(){
        return this.cantidad
    }

    static asPokebola(jsonPokebola) {
        return angular.extend(new Pokebola(), jsonPokebola)
     }

}