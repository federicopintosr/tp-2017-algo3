package ar.edu.unsam.Grupo2

import org.junit.Before
import org.uqbar.geodds.Point
import org.junit.Test
import org.junit.Assert
import static org.mockito.Mockito.*
import java.util.List
import ar.edu.unsam.exceptions.BusinessException

class ProcesoTest {
	var Especie pikachu
	var Especie charmander
	var Especie charmeleon
	var Especie raichu
	var Especie charizard
	var Point punto1
	var Point punto2
	var Point punto3
	var Point punto11
	var Point punto22
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
	var Luchador luchador
	var Criador criador
	var Colleccionista colleccionista
	var Jugador lucho
	var Rival fede
	var Jugador pipa
	var Pokebola pokebola
	var Pokebola superbola
	var Pokebola ultrabola
	var Pocion pocion
	var Pocion pocionPremio
	var Pocion superpocion
	var PocionMaxima pocionMaxima
	var RepositorioJugador repoJuga1
	var RepositorioEspecie repoEspe1
	var RepositorioPokemon repoPoke1
	var Actualizacion actualizar
	var ProcesoAgregarAcciones agregaOtraAccion
	var ProcesoCompuesto procesoCompuestoAgrega2Acciones
	var ProcesoQuitarAcciones removerAccion
	var ProcesoAgregarAcciones agregaAccion
	var List<Especie> unaListaDeEspecies = newArrayList
	var List<Jugador> unaListaDeJugadores = newArrayList
	var List<Proceso> listaProcesos
	var List<Repositorio> unaListaDeReposEspecies
	var Accion darPremio
	var DarPremioXNivel darPremioXNivel
	var AreaRectangular area
	var Randoms randoms
	JsonTest json

		
		@Before
	def void init() {

///////////////////////PUNTOS////////////////////////////////////////////////////////////////////////////////

		punto1 = new Point(-34.568258, -58.532522)
		punto2 = new Point(-34.569978, -58.528991)
		punto3 = new Point(-34.568352, -58.532522)
		punto11= new Point(-34.577140, -58.581818)
		punto22= new Point(-22.903514, -43.167868)

///////////////////////TIPO JUGADOR////////////////////////////////////////////////////////////////////////////////
		
		luchador=new Luchador()
		criador= new Criador()		
		
///////////////////////ITEMS////////////////////////////////////////////////////////////////////////////////
			
		pokebola = new Pokebola(80,0,"pokebola")
		pocionPremio = new Pocion(50,30,"pocionPremio")
		superbola = new Pokebola(150,1.1,"superbola")
		ultrabola = new Pokebola(200,1.25,"ultrabola")
		pocion= new Pocion(50,20,"pocion")
		superpocion= new Pocion(120,50,"superpocion")
		pocionMaxima = new PocionMaxima(150)
	 	
///////////////////////POKEMON////////////////////////////////////////////////////////////////////////////////
		
		fuego = new Tipo(#[hielo], #[tierra])
		
		raichu = new Especie(20, 200, 25, null, #[tierra], 10, 2, "raichu", "es pequeño")
		pikachu = new Especie(10, 100, 2, raichu, #[fuego], 10, 1, "pikachu", "su cola es un rayo")
		charizard = new Especie(500, 200, 9999999, null, #[tierra], 10, 3, "charizard", "asd")
		charmeleon = new Especie(10, 100, 36, raichu, #[fuego], 10, 5, "charmeleon", "fgdfs")
		charmander = new Especie(5, 50, 16, charmeleon, #[hielo, agua], 10, 4, "charmander", "asd123")
		

		pika1 = new Pokemon(100, pikachu, punto1,"m")
		charma1 = new Pokemon(50, charmander, punto1,"f")
		chari1= new Pokemon(1000,charizard,punto1,"m") 
		
		pika2 = new Pokemon(40, pikachu, punto1,"m") 
		charma2 = new Pokemon(500, charmeleon, punto1,"f") 
		
		pika3 = new Pokemon(0,raichu, punto1,"m")	
		charma3= new Pokemon(300,charmander,punto2,"m")
		square = new Pokemon(9999999,raichu, punto3,"m")

///////////////////////JUGADORES////////////////////////////////////////////////////////////////////////////////

		lucho=new Jugador(luchador,punto2)
		//fede= new Rival(luchador, punto2,charma1,10)
		pipa = new Jugador(colleccionista,punto1)
		
///////////////////////REPOS Y LISTAS PARA PROCESOS////////////////////////////////////////////////////////////////////////////////
	
		unaListaDeJugadores = #[lucho,pipa]
		unaListaDeEspecies = #[pikachu, charizard]
		
	
		//repoPoke1 = new RepositorioPokemon
		repoJuga1 = new RepositorioJugador(#[pipa,lucho]) 
		
		unaListaDeReposEspecies = #[repoEspe1]

		json = new JsonTest
		
		
		darPremio = new DarPremio(pocion)
		darPremioXNivel = new DarPremioXNivel(1, pocionPremio)
		
		agregaAccion = new ProcesoAgregarAcciones(unaListaDeJugadores, darPremio)
		agregaOtraAccion = new ProcesoAgregarAcciones(unaListaDeJugadores, darPremioXNivel)
		listaProcesos = #[agregaAccion,agregaOtraAccion]
		procesoCompuestoAgrega2Acciones = new ProcesoCompuesto(listaProcesos)
		
		removerAccion = new ProcesoQuitarAcciones (unaListaDeJugadores,darPremio)
		
		area = new AreaRectangular(punto11,punto22)
		
		randoms = new Randoms
		
 }
 

	
/*	@Test
	def void seAgregaLaAccionDeActualizarATodasLasEspecies() {
		 val mockedImportador = mock(typeof(ImportadorJsonEspecie))
		when(mockedImportador.convertidorDeJson(json.getJSONEspecies(),repoEspe1)).thenReturn(unaListaDeEspecies)
		repoEspe1.importador = mockedImportador
		repoEspe1.create(pikachu)
		pikachu1 = new Especie(40, 100, 2, raichu, #[fuego], 10, 1, "pikachu", "su cola es un rayo")
		unaListaDeEspecies.add(pikachu1)
		repoEspe1.importarDesdeJSON(json.getJSONEspecies)
		actualizar = new Actualizacion(unaListaDeReposEspecies)
		actualizar.activar()
		Assert.assertEquals(40,pikachu.puntosAtaqueBase)
	}
	 */
	
@Test (expected=typeof(BusinessException))
def void seQuiereUsarElProcesoActualizarPeroAlTenerUnaListaVaciaLanzaException(){	
		actualizar = new Actualizacion(unaListaDeReposEspecies)
		actualizar.activar()		
		}
@Test
	def void seEjecutaUnProcesoQueTieneLaAccionQueDaUnaPocion() {
		agregaAccion.activar()
		Assert.assertEquals(true,lucho.acciones.contains(darPremio))
	}

@Test
	def void seEjecutaUnProcesoQueTieneLaAccionDeSacarUnaAccion() {
		listaProcesos = #[agregaAccion,agregaOtraAccion,removerAccion]
		agregaAccion.activar()		
		agregaOtraAccion.activar()
		removerAccion.activar()
		Assert.assertEquals(false,lucho.acciones.contains(darPremio))
	}				
	
@Test
	def void seEjecutaUnProcesoQueTieneAcccionDeDarUnaPocion() {
		agregaAccion.activar()
		lucho.ejecutarAcciones()
		Assert.assertEquals(true,lucho.pociones.contains(pocion))
	}
	
@Test
	def void seEjecutaUnProcesoCompuestoQueTieneAcccionDeDar2Pociones() {
		procesoCompuestoAgrega2Acciones.activar()
		lucho.ejecutarAcciones()
		Assert.assertEquals(true,lucho.pociones.contains(pocionPremio))
	}
	
@Test
	def void seEjecutaUnProcesoCompuestoQueTieneAcccionDeDar2PocionesYVerificoQueTengoLaAccion() {
		procesoCompuestoAgrega2Acciones.activar()
		Assert.assertEquals(true,lucho.acciones.contains(darPremioXNivel))
	}	
		
@Test
	def void seQuiereCalcularElAreaTotalDeUnAreaRectangular(){
		area.definirPuntos()
		Assert.assertEquals(1684928.57,area.calcularArea(),0.1)
	}	

//@Test 
//	def void seCreaUnPoquemonEnUnAreaYSeLoColocaEnRepositorioPokemon(){
//		var PoblarArea poblarArea
//		area.definirPuntos()
//		poblarArea = new PoblarArea(repoPoke1,unaListaDeEspecies,area,10)
//		poblarArea.activar()
//		Assert.assertEquals(true,repoPoke1.pokemones.contains(#[]))
//	}
//	


	}