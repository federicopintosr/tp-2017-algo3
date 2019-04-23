class Pocion{
    constructor(_nombre, _cantidad){
        this.nombre= _nombre
        this.cantidad= _cantidad
    }

    static asPocion(jsonPocion) {
        return angular.extend(new Pocion(), jsonPocion)
     }

}