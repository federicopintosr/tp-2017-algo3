class Entrenador {

    constructor(_nombre, _experiencia, _dinero,_tipo) {
        this.nombre=_nombre
        this.dinero= _dinero
        this.experiencia=_experiencia
        this.tipo = _tipo
    }

     getNivel() {
       return nivel.getNivel(this.experiencia) //problema con el nivel
    }
     

    esExperto(){
        return true
    }

    chancesExperto() {
		if (this.getEsExperto()) {
			return 0.5
        }	
        return 0
    }



    chancesDeAtrapar(_pokebola) {
        this.getNivel() * (1 + _pokebola.getChances() * (1 + this.chancesExperto()))	
    }

    

    static asEntrenador(jsonEntrenador) {
        return angular.extend(new Entrenador(), jsonEntrenador)
     }




}