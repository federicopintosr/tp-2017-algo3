describe('pokemon', () => {
    let poke
  

    beforeEach(() => {
        poke = new Pokemon()
        poke.experiencia=0


    })

    it('un pokemon tiene experiencia 0 inicialmente', () => {
        expect(0).toBe(poke.experiencia)
    })

    it('un pokemon tiene experiencia 0 nivel 1 inicialmente', () => {
        expect(1).toBe(poke.getNivel())
    })

    it('pokemon con experiencia igual a 200 tiene nivel OK', () => {
        poke.experiencia = 200
        expect(2).toBe(poke.getNivel())
    })



})