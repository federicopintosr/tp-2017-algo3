const nivel = {

    mapaNiveles : {
        0 : 1,
        1000 : 2, 
        3000 : 3, 
        6000 : 4, 
        10000 : 5, 
        15000 : 6, 
        21000 : 7, 
        28000 : 8, 
        36000 : 9,
        45000 : 10, 
        55000 : 11, 
        65000 : 12, 
        75000 : 13, 
        85000 : 14, 
        100000 : 15, 
        120000 : 16, 
        140000 : 17,
        160000 : 18, 
        185000 : 19, 
        210000 : 20
    },

    getNivel(experiencia) {
        var nivel = 0
        for (var i in this.mapaNiveles) {
            if (experiencia >= this.mapaNiveles[i]) {
                nivel = nivel + 1
            }
        }
        return nivel
    }
        

}
