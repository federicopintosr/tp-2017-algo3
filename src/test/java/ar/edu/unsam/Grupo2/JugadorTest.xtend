package ar.edu.unsam.Grupo2

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point
import ar.edu.unsam.exceptions.BusinessException

class JugadorTest {
	var Especie pikachu
	var Especie charmander
	var Especie charmeleon
	var Especie raichu
	var Especie charizard
	var Point punto1
	var Point punto2
	var Point punto3
	var Pokemon pika1
	var Pokemon charma1
	var Pokemon pika2
	var Pokemon charma2
	var Pokemon pika3
	var Pokemon chari1
	var Pokemon charma3
	var Pokemon square
	var Tipo tierra
	var Tipo fuego
	var Tipo hielo
	var Tipo agua
	var Tipo hierva
	var Tipo electricidad
	var Luchador luchador
	var Criador criador
	var Colleccionista colleccionista
	var Jugador lucho
	var Rival fede
	var Jugador pipa
	var Pokeparada poke1
	var Pokeparada poke2
	var Pokebola pokebola
	var Pokebola superbola
	var Pokebola ultrabola
	var Pocion pocion
	var Pocion superpocion
	var PocionMaxima pocionMaxima
	var Ingrediente hierro
	var Ingrediente calcio
	var Ingrediente zinc
	var Ingrediente proteina	
	var Ingrediente fertilizante	
	var Ingrediente purificador	
	var Ingrediente combustible
	var Ingrediente cobre
	
	@Before
	def void init() {

		punto1 = new Point(-34.568258, -58.532522)
		punto2 = new Point(-34.569978, -58.528991)
		punto3 = new Point(-34.568352, -58.532522)
		
		luchador=new Luchador()
		criador= new Criador()		
		
		
		pokebola = new Pokebola(80,0,"pokebola")
		superbola = new Pokebola(150,1.1,"superbola")
		ultrabola = new Pokebola(200,1.25,"ultrabola")
		pocion= new Pocion(50,20,"pocion")
		superpocion= new Pocion(120,50,"superpocion")
		pocionMaxima = new PocionMaxima(150)
	 	hierro = new IngredienteSuma(10.0,5.0)
	 	hierro.setDecorado(pocion)
 		calcio = new IngredienteSuma(15.0,10.0)
 		calcio.setDecorado(hierro)
		zinc = new IngredientePorcentaje(15.0,0.3)
		zinc.setDecorado(pocion)
		proteina = new IngredientePorcentaje(40.0,0.45)
		fertilizante = new IngredienteTipo(40.0,0.2,hierva,0.5)
		purificador = new IngredienteTipo(35.0,0.15,agua,0.4)
		cobre = new IngredienteTipo(35.0,0.2,electricidad,0.50)
		
		fuego = new Tipo(#[hielo], #[tierra])

		combustible = new IngredienteTipo(35.0,0.2,fuego,0.45)
		combustible.setDecorado(pocion)
		
		//poke1= new Pokeparada(punto1,"Pokeparada Obelisco",#[pokebola,superbola,pocion,hierro,zinc,combustible,pocionMaxima,calcio])
		//poke2= new Pokeparada(punto1,"Pokeparada Unsam",#[superbola,ultrabola,superpocion])
		
		hielo = new Tipo(#[agua],#[tierra])
		tierra = new Tipo(#[agua],#[hielo])
		agua = new Tipo(#[fuego],#[hielo])
		electricidad= new Tipo(#[fuego],#[hielo])
		               
	


		raichu= new Especie(20,200,25,null,#[tierra],10,2,"raichu","es pequeño")
		pikachu = new Especie(10, 100,2,raichu,#[fuego],10,1,"pikachu","su cola es un rayo")
		charizard= new Especie(500,200,9999999,null,#[tierra],10,3,"charizard","asd")
		charmander = new Especie(5, 50,16,charmeleon,#[hielo,agua],10,4,"charmander","asd123")
		charmeleon = new Especie(10,100,36,raichu,#[fuego],10,5,"charmeleon","fgdfs")

		

		pika1 = new Pokemon(100, pikachu, punto1,"m")
		charma1 = new Pokemon(50, charmander, punto1,"f")
		chari1= new Pokemon(1000,charizard,punto1,"m") 
		
		pika2 = new Pokemon(40, pikachu, punto1,"m") 
		charma2 = new Pokemon(500, charmeleon, punto1,"f") 
		
		pika3 = new Pokemon(0,raichu, punto1,"m")	
		charma3= new Pokemon(300,charmander,punto2,"m")
		square = new Pokemon(9999999,raichu, punto3,"m")

	//	fede= new Rival(luchador, punto2,charma1,10)
		lucho=new Jugador(luchador,punto2)
		pipa = new Jugador(colleccionista,punto1)
		
		
		
	}
	//////////////////////////////////SolicitudDeAmistad///////////////////////////////////////////

	@Test
	def void unJugadorEnviaUnaSolicitudDeAmistadYFedeVerificaQueTieneUnaSolicitudDeAmistad(){
		lucho.enviarSolicitudDeAmistad(fede)
		Assert.assertEquals(true,fede.amigosPendientes.contains(lucho))
		}
	
	@Test
	def void unJugadorEnviaUnaSolicitudDeAmistadYFedeLaAcepta(){
		lucho.enviarSolicitudDeAmistad(fede)
		fede.aceptarSolicitudDeAmistad(lucho)
		Assert.assertEquals(true,fede.amigosActivos.contains(lucho))
		}
		
	@Test
	def void unJugadorEnviaUnaSolicitudDeAmistadYFedeLaAceptaYFedeVerificaQueYaNoTieneALuchoComoPendiente(){
		lucho.enviarSolicitudDeAmistad(fede)
		fede.aceptarSolicitudDeAmistad(lucho)
		Assert.assertEquals(false,fede.amigosPendientes.contains(lucho))
		}
		
	@Test
	def void unJugadorEnviaUnaSolicitudDeAmistadYFedeLaRechaza(){
		lucho.enviarSolicitudDeAmistad(fede)
		fede.rechazarSolicitudDeAmistad(lucho)
		Assert.assertEquals(false,fede.amigosPendientes.contains(lucho))
		}	
		
		
	@Test(expected=typeof(BusinessException))
	def void unJugadorFedeQuiereAceptarAAlguienQueNoLeMandoSolicitudEntoncesException(){
		fede.aceptarSolicitudDeAmistad(lucho)
		}
	
	
	
	/////////////////////////Exp,Tipos,distanciaConPokemon, etc //////////////////////////////
	
	@Test
	def void unJugadorLuchoConExperiencia0EsDeNivel1(){
		Assert.assertEquals(1,lucho.getNivel)
	}
	
	@Test
	def void unJugadorLuchoQueEsLuchadorDeseaCambiarATipoCriador(){
		lucho.cambiarTipo(criador)
		Assert.assertEquals(criador,lucho.tipoDeEntrenador)
	}

	@Test
	def void unJugadorLuchoCalculaLaDistanciaConUnPokemon(){
		Assert.assertEquals(0.163,lucho.distanciaConUnPokemon(pika1),001)
	}
	
	@Test
	def void unJugadorLuchoCalculaLaDistanciaConUnaPokeparada(){
		Assert.assertEquals(0.163,lucho.distanciaConUnaPokeparada(poke1),001)
	}
	
	@Test
	def void unJugadorLuchoAgregaUnPokemonASuEquipo(){
		lucho.agregarPokemon(pika1)
		Assert.assertEquals(true,lucho.equipo.contains(pika1))
	}
	
	@Test
	def void unJugadorLuchoAgregaUnPokemonASuEquipoYVerificaQueEsNuevaLaEspecie(){
		Assert.assertEquals(true,lucho.esNuevaEspecieAgregado(pika1))
	}
	
	@Test
	def void unJugadorLuchoVerificaQueEsPuedeGuardarUnPokemonEnSuEquipo(){
		Assert.assertEquals(false,lucho.equipoLleno())
	}
	
	
	@Test
	def void unJugadorLuchoQueTiene7PokemonesSumaLaCantidadDeMachos(){
		lucho.agregarPokemon(pika1)
		lucho.agregarPokemon(charma1)
		lucho.agregarPokemon(chari1)
		lucho.agregarPokemon(pika2)
		lucho.agregarPokemon(charma2)
		lucho.agregarPokemon(pika3)
		lucho.agregarPokemon(charma3)
		Assert.assertEquals(0,lucho.sumaMachoEquipo)
	}
	
	
	
	@Test
	def void unJugadorLuchoQueTiene2PokemonesVerifaQueLaColeccionEstaBalanceada(){
		lucho.agregarPokemon(pika1)
		lucho.agregarPokemon(charma1)
		Assert.assertEquals(false,lucho.tieneColeccionBalanceada)
	}
	
	@Test
	def void unJugadorLuchoAgregaPokemonesASuEquipoYCuentaCuantasEspeciesTiene(){
		lucho.agregarPokemon(pika1)
		lucho.agregarPokemon(charma1)
		lucho.agregarPokemon(chari1)
		lucho.agregarPokemon(pika2)
		lucho.agregarPokemon(charma2)
		lucho.agregarPokemon(pika3)
		lucho.agregarPokemon(charma3)
		Assert.assertEquals(7,lucho.cantidadEspeciesAtrapadas)
	}
	
	@Test
	def void unJugadorLuchoAgregaPokemonesASuEquipoYCuentaCuantosPokemonesTiene(){
		lucho.agregarPokemon(pika1)
		lucho.agregarPokemon(charma1)
		lucho.agregarPokemon(chari1)
		lucho.agregarPokemon(pika2)
		Assert.assertEquals(4,lucho.cantidadPokemonesAtrapados)
	}
	
	
	@Test
	def void unJugadorLuchoAgregaPokemonesASuEquipoYCuentaCuantosPokemonesTieneMayoresDeNivel20(){
		lucho.agregarPokemon(pika1)
		lucho.agregarPokemon(square)
		Assert.assertEquals(1,lucho.cantidadPokemonesConMasDeNivel20)
	}
	
//...............................Atrapar......................................//	
	@Test
	def void unJugadorLuchoVerificaSiPuedeAtraparUnPokemonPorSuDistanciaYPuede(){
		lucho.ubicacionJugador=punto3
		Assert.assertEquals(true,lucho.puedoAtrapar(pika1))
	}

	@Test
	def void unJugadorLuchoVerificaSiPuedeAtraparUnPokemonPorSuDistanciaYNoPuede(){
		Assert.assertEquals(false,lucho.puedoAtrapar(pika1))
	}
		
	@Test
	def void unJugadorLuchoCalculaQueChancesDeAtraparTieneAUnPokemonUsandoUnaSuperbola(){
		Assert.assertEquals(1.1,lucho.chancesDeAtrapar(superbola),0.01)
	}
	
	@Test
	def void unJugadorLuchoCalculaSiLoAtrapaAUnPokemonUsandoUnaSuperbolaYPuede(){
		Jugador.random=[|return 0.1]
		Assert.assertEquals(true,lucho.loAtrapa(pika1,superbola))
	}
	
	@Test
	def void unJugadorLuchoaCalculaSiLoAtrapaAUnPokemonUsandoUnaSuperbolaYNoPuede(){
		Jugador.random=[|return 0.1]
		Assert.assertEquals(false,lucho.loAtrapa(square,superbola))
	}
		
	
	@Test
	def void unJugadorLuchoAtrapaUnPokemonSumaExperiencia600DeExperienciaPorAtrapar(){
		lucho.ubicacionJugador=punto3
		Jugador.random=[|return 0.1]
		lucho.atraparPokemon(pika1,superbola)
		Assert.assertEquals(600,lucho.experiencia,0.1)
	}
	
	
	@Test
	def void unJugadorLuchoAtrapaUnPokemonYLoAgregaASuEquipo(){
		lucho.ubicacionJugador=punto3
		Jugador.random=[|return 0.1]
		lucho.atraparPokemon(pika1,superbola)
		Assert.assertEquals(true,lucho.equipo.contains(pika1))
	}
	@Test
	def void unJugadorLuchoAtrapaUnPokemonDeEspecieRepetidaYSumaExperiencia100DeExperienciaPorAtrapar(){
		lucho.agregarPokemon(pika2)
		lucho.ubicacionJugador=punto3
		Jugador.random=[|return 0.1]
		lucho.atraparPokemon(pika1,superbola)
		Assert.assertEquals(100,lucho.experiencia,0.1)
		}
	
		@Test(expected = typeof(BusinessException))
	def void unJugadorLuchoNoPuedeAtraparUnPokemonPorSuDistanciaYNoLoAgregaASuEquipo(){
		Jugador.random=[|return 0.1]
		lucho.atraparPokemon(pika1,superbola)	
	}
	
	//..................................Combate......................................//
	@Test
	def void unJugadorLuchoEsExperto(){
		lucho.combatesGanados = 30
		lucho.experiencia=300000
		Assert.assertEquals(true,lucho.tipoDeEntrenador.esExperto(lucho))
	}
	
	@Test
	def void unJugadorLuchoNoEsExpertoPorQueNoAlcanzaConLaExperiencia(){
		lucho.combatesGanados = 30
		lucho.experiencia=50
		Assert.assertEquals(false,lucho.tipoDeEntrenador.esExperto(lucho))
	}
	
	@Test
	def void unJugadorLuchoEsExpertoYTieneUnasChancesDeEntrenadorDe4(){
		lucho.combatesGanados = 30
		lucho.experiencia=300000
		Assert.assertEquals(4,lucho.chancesEntrenador(pika1),0.01)
	}
	@Test
	def void unJugadorLuchoNoEsExpertoYTieneUnasChancesDeEntrenadorDe0(){
		lucho.combatesGanados = 30
		lucho.experiencia=50
		Assert.assertEquals(0,lucho.chancesEntrenador(pika1),0.01)
	}
	
	@Test
	def void unJugadorLuchoEsExpertoVaACombatirConPika1ContraCharma1YTieneUnasChancesPropiasDe0(){
		lucho.combatesGanados = 30
		lucho.experiencia=300000
		Assert.assertEquals(4,lucho.chancesPropias(pika1,charma1),0.01)
	}	
	
	@Test
	def void unJugadorLuchoEsExpertoVaACombatirConCharma1contraPika1YTieneUnasChancesPropiasDe0(){
		lucho.combatesGanados = 30
		lucho.experiencia=300000
		Assert.assertEquals(2.25,lucho.chancesPropias(charma1,pika1),0.01)
	}	
	
	@Test
	def void unJugadorLuchoNoExpertoVaACombatirConPika1YTieneUnasChancesPropiasDe0(){
		lucho.combatesGanados = 30
		lucho.experiencia=50
		Assert.assertEquals(0,lucho.chancesPropias(pika1,charma1),0.01)
	}	
	
	@Test
	def void unJugadorLuchoEsExpertoVaACombatirConPika1ContraCharma1YVerificaQuePuedeGanarLaBatalla(){
		lucho.combatesGanados = 30
		lucho.experiencia=300000
		Assert.assertEquals(0.76,lucho.calculoParaGanar(pika1,fede),0.1)
	}
	@Test
	def void unJugadorLuchoEsExpertoVaACombatirConPika1ContraCharma1GanaElCombateYSumaElDinero(){
		lucho.combatesGanados = 30
		lucho.experiencia=300000
		lucho.agregarPokemon(pika1)
		lucho.combate(pika1,fede,200)
		Assert.assertEquals(10200,lucho.dinero,0.1)
	}
	
	@Test
	def void unJugadorCorroboraQueUnPokemonPerteneceAlEquipo(){
		lucho.agregarPokemon(pika1)
		Assert.assertEquals(true,lucho.equipo.contains(pika1))
	}
	@Test
	def void aUnJugadorLuchoSeLeSumaDineroPorHaberGanadoCombate(){
		lucho.sumaDineroPorCombateGanado(200)
		Assert.assertEquals(10200,lucho.dinero,0.01)
	}
	
	@Test
	def void aUnJugadorLuchoSeLeRestaDineroPorHaberPerdidoCombate(){
		lucho.pierdoDineroPorCombatePerdido(50)
		Assert.assertEquals(9950,lucho.dinero,0.01)
	}
	
	@Test
	def void aUnJugadorLuchoSumaUnaExperienciaFijaPorPoderEvolucionarUnPokemon(){
		lucho.sumaExperienciaPorCombateGanado()
		lucho.sumaExperienciaPorEvolucion(pika1)
		Assert.assertEquals(500,lucho.experiencia,0.01)
	}
	
	@Test
	def void aUnJugadorLuchoSumaUnaExperienciaFijaPorHaberGanadoCombate(){
		lucho.sumaExperienciaPorCombateGanado()
		Assert.assertEquals(300,lucho.experiencia,0.01)
	}
	
	
	//...................................Pokeparada........................................//
	
	@Test
	def void unJugadorLuchosTiene100DeDineroYSeEncuentraAMenosDe10MetrosYPuedeComprarPokebola(){
		lucho.ubicacionJugador=punto3
		lucho.comprarPokebolaEnPokeparada(poke1,pokebola)
		Assert.assertEquals(true,lucho.pokebolas.contains(pokebola))
	}
	@Test
	def void unJugadorLuchosTiene10DeDineroYSeEncuentraAMenosDe10MetrosYNoPuedeComprarSuperPokebola(){
		lucho.ubicacionJugador=punto3
		lucho.setDinero(10)
		lucho.comprarPokebolaEnPokeparada(poke1,superbola)
		Assert.assertEquals(false,lucho.pokebolas.contains(superbola))
	}
	@Test
	def void unJugadorLuchosTiene100DeDineroYSeEncuentraAMenosDe10MetrosYPuedeComprarPocion(){
		lucho.ubicacionJugador=punto3
		lucho.comprarPocionEnPokeparada(poke1,pocion)
		Assert.assertEquals(true,lucho.pociones.contains(pocion))
	}
	@Test
	def void unJugadorLuchosTiene100DeDineroYSeEncuentraAMenosDe10MetrosYNoPuedeComprarSuperPocion(){
		lucho.ubicacionJugador=punto3
		lucho.setDinero(100)
		//poke1= new Pokeparada(punto1,"Pokeparada Obelisco",#[pokebola,superbola,superpocion])
		lucho.comprarPocionEnPokeparada(poke1,superpocion)
		Assert.assertEquals(false,lucho.pociones.contains(superpocion))
	}
	
	@Test
	def void unJugadorLuchoCuraAunPoquemon(){
		pika1.inicializaSalud
		lucho.ubicacionJugador=punto3
		lucho.comprarPocionEnPokeparada(poke1,pocion)
		lucho.usarPocion(pika1,pocion)
		Assert.assertEquals(220,pika1.salud,0.01)
	}
	@Test
	def void unJugadorLuchoCuraAunPoquemonPorCompletoEnPokeparada(){
		pika1.inicializaSalud
		lucho.ubicacionJugador=punto3
		lucho.curarPokemonEnPokeparada(poke1,pika1)
		Assert.assertEquals(200,pika1.salud,0.01)
	}
	
	@Test
	def void unJugadorLuchoPasaAunPoquemonDeEquipoADeposito(){
		lucho.agregarPokemon(pika1)
		lucho.cambiarPokemonADeposito(pika1)
		Assert.assertEquals(true,lucho.deposito.contains(pika1))
	
	}
	
	@Test
	def void unJugadorLuchoPasaAunPoquemonDeDepositoAEquipo(){
		lucho.deposito.add(pika1)
		lucho.cambiarPokemonAEquipo(pika1)
		Assert.assertEquals(true,lucho.equipo.contains(pika1))
	
	}
	@Test
	def void unPokeparadaValidaItem(){
		Assert.assertEquals(true,poke1.validarItems("superbola"))
		
	}
	
	///////////////////////////////////Ingredientes/////////////////////////////////////////////////////////////////
	@Test
	def void unJugadorLuchoCuraAunPoquemonConUnaPocionConHierro(){
		pika1.inicializaSalud
		lucho.ubicacionJugador=punto3
		lucho.comprarIngredienteEnPokeparada(poke1,hierro)
		lucho.usarIngrediente(pika1,hierro) // 200 (salud del pokemon + 50 de la pocion + 5 del hierro
		Assert.assertEquals(225,pika1.salud,0.01)
	}	
	
	@Test
	def void unJugadorLuchoCuraAunPoquemonConUnaPocionConZinc(){
		pika1.inicializaSalud
		lucho.ubicacionJugador=punto3
		lucho.comprarIngredienteEnPokeparada(poke1,zinc)
		lucho.usarIngrediente(pika1,zinc) 
		Assert.assertEquals(226,pika1.salud,0.01)
	}
	
	@Test
	def void unJugadorLuchoCuraAunPoquemonTipoFuegoConUnaPocionConCombustible(){
		pika1.inicializaSalud
		lucho.ubicacionJugador=punto3
		lucho.comprarIngredienteEnPokeparada(poke1,combustible)
		lucho.usarIngrediente(pika1,combustible) 
		Assert.assertEquals(229,pika1.salud,0.01)
	}
	
	@Test
	def void unJugadorLuchoCuraAunPoquemonTipoTierraConUnaPocionConCombustibleYNoSumaElPorcentajePorTipo(){
		chari1.inicializaSalud
		lucho.ubicacionJugador=punto3
		lucho.comprarIngredienteEnPokeparada(poke1,combustible)
		lucho.usarIngrediente(chari1,combustible) 
		Assert.assertEquals(1024,chari1.salud,0.01)
	}
		
	@Test
	def void unJugadorLuchoCuraAunPoquemonConUnaPocionConHierroYConCalcio(){
		pika1.inicializaSalud
		lucho.ubicacionJugador=punto3
		lucho.comprarIngredienteEnPokeparada(poke1,zinc)
		lucho.comprarIngredienteEnPokeparada(poke1,calcio)
		lucho.usarIngrediente(pika1,calcio) 
		Assert.assertEquals(235,pika1.salud,0.01)
	}
	
	
	
	@Test(expected=typeof(BusinessException))
	def void unJugadorLuchoIntentaComprarUnIngredienteQueNoEstaEnEsaPokeparadaEntoncesException(){
		pika1.inicializaSalud
		lucho.ubicacionJugador=punto3
		lucho.comprarIngredienteEnPokeparada(poke1,proteina)
		
	}
	
	@Test
	def void unJugadorLuchoCuraAunPokemonConUnaSuperPocion(){
		pika1.inicializaSalud
		lucho.ubicacionJugador=punto3
		lucho.comprarPocionEnPokeparada(poke1,pocionMaxima)
		lucho.usarPocion(pika1,pocionMaxima)
		Assert.assertEquals(400,pika1.salud,0.01)
	}
	
	
		
	
}