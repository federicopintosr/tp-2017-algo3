package ar.edu.unsam.Grupo2

import org.uqbar.geodds.Point
import org.junit.Before
import org.junit.Test
import org.junit.Assert
import ar.edu.unsam.exceptions.BusinessException
import static org.mockito.Mockito.*
import java.util.List

class RepositorioEspecieTest {
	var Especie pikachu
	var Especie charmander
	var Especie charmeleon
	var Especie raichu
	var Especie charizard
	var Especie pikachu1
	var Point punto1
	var Point punto2
	var Point punto3
	var Tipo tierra
	var Tipo fuego
	var Tipo hielo
	var Tipo agua
	var RepositorioEspecie repositorioEspecie
	JsonTest json
	var List<Especie> unaListaDeEspecie = newArrayList
	
	
	@Before
	def void init() {

		punto1 = new Point(-34.568258, -58.532522)
		punto2 = new Point(-34.569978, -58.528991)
		punto3 = new Point(-34.568352, -58.532522)

		fuego = new Tipo(#[hielo], #[tierra])
		hielo = new Tipo(#[agua], #[tierra])
		tierra = new Tipo(#[agua], #[hielo])
		agua = new Tipo(#[fuego], #[hielo])

		raichu = new Especie(20, 200, 25, null, #[tierra], 10, 2, "raichu", "es pequeño")
		pikachu = new Especie(10, 100, 2, raichu, #[fuego], 10, 1, "pikachu", "su cola es un rayo")
		charizard = new Especie(500, 200, 9999999, null, #[tierra], 10, 3, "charizard", "asd")
		charmeleon = new Especie(10, 100, 36, raichu, #[fuego], 10, 5, "charmeleon", "fgdfs")
		charmander = new Especie(5, 50, 16, charmeleon, #[hielo, agua], 10, 4, "charmander", "asd123")

		json = new JsonTest
		

	}

	@Test
	def void elRepositorioEspecieCreaUnaNuevaEspecieQueEsValida() {
		repositorioEspecie.create(pikachu)
		Assert.assertEquals(true, repositorioEspecie.elementos.contains(pikachu))
	}

	@Test
	def void elRepositorioEspecieCreaUnaNuevaEspecieQueEsValidaYCorroboramosQueSuIdEs1() {
		repositorioEspecie.create(pikachu)
		Assert.assertEquals(1, pikachu.id)
	}

	@Test
	def void elRepositorioEspecieCreaUnaNuevaEspecieQueEsValidaYCorroboramosQueIncrementoEn1ElProximoValorDeIdEs2() {
		repositorioEspecie.create(charmander)
		repositorioEspecie.create(pikachu)
		Assert.assertEquals(2, pikachu.id)
	}

	@Test(expected=typeof(BusinessException))
	def void elRepositorioEspecieIntentaCreaUnaNuevaEspecieQueNoEsValidaYNoLaCrea() {
		repositorioEspecie.create(raichu)
	}

	@Test
	def void elRepositorioEspecieCreaUnaNuevaEspecieQueEsValidaYDecideBorrarlaDelRepositorio() {
		repositorioEspecie.create(pikachu)
		repositorioEspecie.delete(pikachu)
		Assert.assertEquals(false, repositorioEspecie.elementos.contains(pikachu))
	}

	@Test
	def void elRepositorioEspecieCreaUnaNuevaEspecieQueEsValidaYDecideBuscarlaPorSuId() {
		repositorioEspecie.create(pikachu)
		Assert.assertEquals(pikachu, repositorioEspecie.searchById(1))
	}

	@Test
	def void elRepositorioEspecieCreaUnaNuevaEspecieQueEsValidaYDecideBuscarlaMedianteUnString() {
		repositorioEspecie.create(pikachu)
		repositorioEspecie.create(charmander)
		Assert.assertEquals(#[pikachu], repositorioEspecie.search("pikachu"))
	}

	@Test
	def void elRepositorioEspecieCreaUnaNuevaEspecieQueEsValidaYUpdateaLosParametros() {
		var Especie pikachu1
		repositorioEspecie.create(pikachu)
		pikachu1 = new Especie(40, 100, 2, raichu, #[fuego], 10, 1, "pikachu", "su cola es un rayo")
		repositorioEspecie.update(pikachu, pikachu1)
		Assert.assertEquals(40, pikachu.puntosAtaqueBase)
	}

	@Test(expected=typeof(BusinessException))
	def void elRepositorioEspecieUpdateaLosParametrosDeUnaEspecieQueNoEstaCreadaEntoncesLanzaException() {
		var Especie pikachu1
		pikachu1 = new Especie(40, 100, 2, raichu, #[fuego], 10, 1, "pikachu", "su cola es un rayo")
		repositorioEspecie.update(pikachu, pikachu1)
	}
	
	@Test
	def void elRepositorioEspecieRecibeUnJsonYUpdatea() {
		pikachu1 = new Especie(40, 100, 2, raichu, #[fuego], 10, 1, "pikachu", "su cola es un rayo")
		repositorioEspecie.create(pikachu1)
		repositorioEspecie.importarDesdeJSON(json.getJSONEspecies)
		repositorioEspecie.updateAll()
		Assert.assertEquals(10, pikachu1.puntosAtaqueBase)
	}
	
	@Test(expected=typeof(BusinessException))
	def void elRepositorioEspecieRecibeUnJsonPeroLaEspecieNoExisteEntoncesLanzaException() {
		repositorioEspecie.create(charmeleon)
		repositorioEspecie.agregarTipos(fuego)
		repositorioEspecie.agregarTipos(tierra)
		repositorioEspecie.importarDesdeJSON(json.getJSONEspecies)
		repositorioEspecie.updateAll()
		
	}
	
	@Test
	def void elRepositorioEspecieRecibeUnRecibeListaEspecieConImportadorMockeado() {
	 val mockedImportador = mock(typeof(ImportadorJsonEspecie))
	when(mockedImportador.convertidorDeJson(json.getJSONEspecies(),repositorioEspecie)).thenReturn(unaListaDeEspecie)
	repositorioEspecie.importador = mockedImportador
	repositorioEspecie.create(pikachu)
	pikachu1 = new Especie(200,400, 5, raichu, #[fuego], 50, 1, "pikachu", "es afeminado")
	unaListaDeEspecie.add(pikachu1)
	repositorioEspecie.importarDesdeJSON(json.getJSONEspecies)
	repositorioEspecie.updateAll()
	Assert.assertEquals("es afeminado", pikachu.descripcion)
			
	}

	
}
