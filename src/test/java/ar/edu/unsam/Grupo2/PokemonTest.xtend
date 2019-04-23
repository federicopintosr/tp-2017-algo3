package ar.edu.unsam.Grupo2

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point


class PokemonTest{

	var Especie pikachu
	var Especie charmander
	var Especie charmeleon
	var Especie raichu
	var Especie charizard
	var Point punto1
	var Point punto2
	var Pokemon pika1
	var Pokemon charma1
	var Pokemon pika2
	var Pokemon charma2
	var Pokemon pika3
	var Pokemon chari1
	var Tipo tierra
	var Tipo fuego
	var Tipo hielo
	var Tipo agua
	var Luchador luchador
	var Criador criador
	var Jugador lucho
	

	 @Before
	def void init() {

		punto1 = new Point(-34.568258, -58.532522)
		punto2 = new Point(-34.569978, -58.528991)
		
		luchador=new Luchador()
		criador= new Criador()
		
		lucho=new Jugador(luchador,punto2)		
		
				
		hielo = new Tipo(#[agua],#[tierra])
		tierra = new Tipo(#[agua],#[hielo])
		fuego = new Tipo(#[hielo],#[tierra])
		agua = new Tipo(#[fuego],#[hielo])	

		raichu= new Especie(20,200,25,null,#[tierra],10,2,"raichu","es pequeño")
		pikachu = new Especie(10, 100,2,raichu,#[fuego],10,1,"pikachu","su cola es un rayo")
		charizard= new Especie(500,200,9999999,null,#[tierra],10,3,"charizard","asd")
		charmander = new Especie(5, 50,16,charmeleon,#[hielo,agua],10,4,"charmander","asd123")
		charmeleon = new Especie(10,100,36,raichu,#[fuego],10,5,"charmeleon","fgdfs")



		pika1 = new Pokemon(100,pikachu,punto1,"m")
		charma1 = new Pokemon(50,charmander,punto1,"f")
		chari1= new Pokemon(1000,charizard,punto1,"m")
		
		pika2 = new Pokemon(40,pikachu,punto1,"m") 
		charma2 = new Pokemon(500,charmeleon,punto1,"f") 
		
		pika3 = new Pokemon(0,raichu,punto1,"m")	
	}
	

	@Test
	def void pokemonPikachuConExperiencia100EsDeNivel2() {
		Assert.assertEquals(2, pika1.getNivel(), 0.01)
	}
	
	@Test
	def void pokemonPikachuConExperiencia10EsDeNivel1() {
		Assert.assertEquals(1, pika2.getNivel(), 0.01)
	}
	

	
	@Test
	def void pokemonPikachuConExperiencia0EsDeNivel1() {
		Assert.assertEquals(1, pika3.getNivel(), 0.01)
	}
	
	@Test
	def void pokemonPikachuNivel2AtacaCon20PuntosDeAtaque(){
		Assert.assertEquals(20, pika1.puntosDeAtaque,0.01)				
	}
	
	@Test
	def void charmanderNivel3AtacaCon15PuntosDeAtaque(){
		Assert.assertEquals(30, charma2.puntosDeAtaque,0.01)				
	}	

	@Test
	def void pokemonPikachuNivel1Tiene100PuntosDeSalud(){
		Assert.assertEquals(100,pika2.puntosDeSaludMaxima,0.01)	
	}
	@Test
	def void pokemonPikachuNivel2TienePuntosDeSalud(){
		Assert.assertEquals(200,pika1.puntosDeSaludMaxima,0.01)	
	}
	
	@Test
	def void pokemonPikachuEstaAUnaDistanciaDelPuntoB(){		
		Assert.assertEquals(0.163,pika1.calculoDistancia(punto2),001)	
	}
	
	@Test 
	def void pokemonPikachuAlcanzaNivelParaEvolucionarARaichu(){
		pika1.evolucionar
		Assert.assertEquals(raichu,pika1.especie)
	}
	 
	@Test
	def void pokemonPikachuEsDeTipoFuegoYEsResistenteContraTipoTierra(){
		Assert.assertEquals(true,pika1.soyResistenteContra(pika3))
		}
//////////////////////////////////////////
	@Test
	def void pokemonPika1CompruebaEspecie(){			
			Assert.assertEquals(pikachu,pika1.getEspecie())
	}

	@Test
	def void pokemonRaichuCompruebaQueEsDeTierra(){			
			Assert.assertEquals(true,raichu.esDeTipo(tierra))
	}
	
	@Test
	def void pokemonPikachuCompruebaQueEsDeFuego(){			
			Assert.assertEquals(true,pikachu.esDeTipo(fuego))
	}
	@Test
	def void fuegoCompruebaQueEsResistenteATierra(){			
			Assert.assertEquals(true,fuego.resistentes.contains(tierra))
	}
	
	@Test
	def void pokemonPika3CompruebaEspecie(){			
			Assert.assertEquals(raichu,pika3.getEspecie())
	}	
	
/////////////////////////////////////////////
	
	@Test
	def void pokemonCharmeleonEsDeTipoAguaYFuerteContraTipoFuego(){
		charmeleon = new Especie(10,100,36,raichu,#[agua],10,5,"charmeleon","fgdfs")
		charma2 = new Pokemon(500,charmeleon,punto1,"f") //agua
		
		charizard= new Especie(500,200,9999999,null,#[fuego],10,3,"charizard","asd")
		chari1= new Pokemon(1000,charizard,punto1,"m") // fuego
		
		Assert.assertEquals(true,charma2.soyFuerteContra(chari1))
	}
	
	@Test
	def void pokemonCharmeleonEsDeTipoAguaYResistenteContraTipoHielo(){
		charmeleon = new Especie(10,100,36,raichu,#[agua],10,5,"charmeleon","fgdfs")
		charma2 = new Pokemon(500,charmeleon,punto1,"f") //agua
		
		charma1 = new Pokemon(50,charmander,punto1,"f") // hielo
		charmander = new Especie(5, 50,16,charmeleon,#[hielo],10,4,"charmander","asd123")

		Assert.assertEquals(true,charma2.soyResistenteContra(charma1))
	}
	
	@Test
	def void unPokemonPikachuSeEncuentraEnUnPuntoYSeMueveAOtroPunto(){
		pika1.moverse(punto2)
		Assert.assertEquals(punto2,pika1.ubicacion)
	}
	
	@Test
	def void unPokemonPikachuDeVelocidad10ConUnNivel2TieneUnasChancesDeEscaparDe4(){
		Assert.assertEquals(4,pika1.chancesDeEscapar)
	}
	
	@Test
	def void unPokemonPikachuNoEsFuerteContraPokemonDeTipoHieloPorLotantoObtiene0DeChancesFuerte(){
		Assert.assertEquals(0,pika1.chancesFuerte(charma2),0.1)
	}
	
	@Test
	def void unPokemonPikachuNoEsResistenteContraPokemonDeTipoHieloPorLotantoObtiene0DeChancesFuerte(){
		Assert.assertEquals(0,pika1.chancesFuerte(chari1),0.1)
	}
	
	@Test
	def void unPokemonPikachuRecibe133DañoDeOtroPokemonPikachuDeNivel1(){
		pika1.getPuntosDeSaludMaxima
		Assert.assertEquals(0,pika1.dañoRecibido(pika2),0.01)
	}
	
	@Test
	def void unPokemonPikachuRecibeDañoDeOtroPokemonYSuSaludDisminuye(){
		pikachu = new Especie(10, 100,2,raichu,#[fuego],10,1,"pikachu","su cola es un rayo")
		pika1 = new Pokemon(1000,pikachu,punto1,"m")
		pika2 = new Pokemon(2000,pikachu,punto1,"m")
		pika1.inicializaSalud
		pika2.inicializaSalud
		pika1.recibeDaño(pika2)
		Assert.assertEquals(500,pika1.salud,0.01)
	}

	@Test
	def void testeaPuntosDeAtaqueBasePîka1(){
		pika1 = new Pokemon(1000,pikachu,punto1,"m")
		pika2 = new Pokemon(2000,pikachu,punto1,"m")
		pikachu = new Especie(10, 100,2,raichu,#[fuego],10,1,"pikachu","su cola es un rayo")
		pika1.inicializaSalud
		pika2.inicializaSalud
		Assert.assertEquals(50,pika1.puntosDeAtaque,0.01)
	}
	
	@Test
	def void testeaPuntosDeAtaqueBasePika2(){
		pika2 = new Pokemon(1000,pikachu,punto1,"m")
		pikachu = new Especie(10, 100,2,raichu,#[fuego],10,1,"pikachu","su cola es un rayo")	
		Assert.assertEquals(50,pika2.puntosDeAtaque,0.01)
	}
	
	
	
	@Test
	def void unPokemonPikachuCompruebaSalud(){
		pika1.inicializaSalud
		Assert.assertEquals(200,pika1.puntosDeSaludMaxima,0.01
		)
	}
		
	@Test
	def void unPokemonPikachuSumaExperienciaDeOtroPokemonRivalYEvoluciona(){
		pika1.getPuntosDeSaludMaxima
		Assert.assertEquals(raichu,pika1.sumaExperiencia(pika2))
	}
	
	@Test
	def void unPokemonPikachuCalculoExperienciaAdicional(){
		pika1.getPuntosDeSaludMaxima
		Assert.assertEquals(4,pika1.calculaExperienciaAdicional(pika2),0.1)
	}
	@Test
	def void unPokemonPikachuConSalud50AumentaPorPocionA70(){
		pika1.salud=50
		pika1.curarPokemon(20)
		Assert.assertEquals(70,pika1.salud,0.01)
	}

	@Test
	def void unJugadorLuchoAgregaUnPokemonASuEquipo(){
		lucho.equipoLleno()
		lucho.agregarPokemon(pika1)
		Assert.assertEquals(true,lucho.equipo.contains(pika1))
	}
	
	
	
	
	
		
}