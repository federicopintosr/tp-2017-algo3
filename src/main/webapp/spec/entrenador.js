describe('entrenador', () => {
    let ash
  
    beforeEach(() => {
      ash = new Entrenador("Lucho Targaryen",550,3500,"Coleccionista")
    })
  
    it('un Entrenador tiene experiencia 0 inicialmente', () => {
        expect(0).toBe(ash.experiencia)
    }) 

 

  })