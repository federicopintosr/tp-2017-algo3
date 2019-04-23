package ar.edu.unsam.Grupo2

import org.uqbar.geodds.Point
import org.junit.Before
import org.junit.Test
import org.junit.Assert
import ar.edu.unsam.exceptions.BusinessException

class RepositorioPokeparadaTest {
	var Point punto1
	var Point punto2
	var Point punto3
	var Pokeparada poke1
	var Pokeparada poke2
	var Pokebola pokebola
	var Pokebola superbola
	var Pokebola ultrabola
	var Pocion pocion
	var Pocion superpocion
	var RepositorioPokeparada repositorioPokeparada
	JsonPokeparada json
	

	@Before
	def void init() {

		punto1 = new Point(-34.568258, -58.532522)
		punto2 = new Point(-34.569978, -58.528991)
		punto3 = new Point(-34.568352, -58.532522)

		pokebola = new Pokebola(80, 0, "pokebola")
		superbola = new Pokebola(150, 1.1, "superbola")
		ultrabola = new Pokebola(200, 1.25, "ultrabola")
		pocion = new Pocion(50, 20, "pocion")
		superpocion = new Pocion(120, 50, "superpocion")

		//poke1 = new Pokeparada(punto1, "Pokeparada Obelisco", #[pokebola, superbola, pocion])
		//poke2 = new Pokeparada(punto1, "Pokeparada Unsam", #[superbola, ultrabola, superpocion])

		//repositorioPokeparada = new RepositorioPokeparada()

		json = new JsonPokeparada
	}

	@Test
	def void elRepositorioPokeparadaCreaUnaNuevaPokeparadaQueEsValida() {
		repositorioPokeparada.create(poke1)
		Assert.assertEquals(true, repositorioPokeparada.elementos.contains(poke1))
	}

	@Test
	def void elRepositorioPokeparadaCreaUnaNuevaPokeparadaQueEsValidaYCorroboramosSuId() {
		repositorioPokeparada.create(poke1)
		Assert.assertEquals(1, poke1.id)
	}

	@Test
	def void elRepositorioPokeparadaCreaUnaNuevaPokeparadaQueEsValidaYCorroboramosQueIncrementoEn1SuProximoValorDeId() {
		repositorioPokeparada.create(poke1)
		repositorioPokeparada.create(poke2)
		Assert.assertEquals(2, poke2.id)
	}

	@Test(expected=typeof(BusinessException))
	def void elRepositorioPokeparadaIntentaCrearUnaNuevaPokeparadaQueNoValidaYNoLaCrea() {
		//poke1 = new Pokeparada(null, "Pokeparada Obelisco", #[pokebola, superbola, pocion])
		repositorioPokeparada.create(poke1)
	}

	@Test
	def void elRepositorioPokeparadaCreaUnaNuevaPokeparadaQueEsValidaPeroDecideBorrarla() {
		repositorioPokeparada.create(poke1)
		repositorioPokeparada.delete(poke1)
		Assert.assertEquals(false, repositorioPokeparada.pokeparadas.contains(poke1))

	}

	@Test
	def void elRepositorioPokeparadaCreaUnaNuevaPokeparadaQueEsValidaYDecideBuscarlaPorSuId() {
		repositorioPokeparada.create(poke1)
		Assert.assertEquals(poke1, repositorioPokeparada.searchById(1))
	}

	@Test
	def void elRepositorioPokeparadaCreaUnaNuevaPokeparadaQueEsValidaYDecideBuscarlaMedianteUnString() {
		repositorioPokeparada.create(poke1)
		Assert.assertEquals(#[poke1], repositorioPokeparada.search("Pok"))
	}

	@Test
	def void elRepositorioPokeparadaCreaUnaNuevaPokeparadaQueEsValidaYDecideBuscarlaMedianteUnItem() {
		repositorioPokeparada.create(poke1)
		Assert.assertEquals(#[poke1], repositorioPokeparada.search("pokebola"))

	}

	@Test
	def void elRepositorioPokeparadaCreaUnaNuevaPokeparadaQueEsValidaYUpdateaLosParametrosYVerificaSuCambio() {
		var Pokeparada pokeparada
		repositorioPokeparada.create(poke1)
		//pokeparada = new Pokeparada(punto2, "Pokeparada Obelisco", #[pokebola, superbola, pocion])
		repositorioPokeparada.update(poke1, pokeparada)
		Assert.assertEquals(punto2, poke1.ubicacion)

	}

	@Test(expected=typeof(BusinessException))
	def void elRepositorioPokeparadaUpdateaLosParametrosPeroNoExisteLaPokeparadaEntoncesLanzaException() {
		var Pokeparada pokeparada
		//pokeparada = new Pokeparada(punto2, "Pokeparada Obelisco", #[pokebola, superbola, pocion])
		repositorioPokeparada.update(poke1, pokeparada)

	}
	
	@Test
	def void elRepositorioPokeparadaRecibeUnJsonYUpdatea() {
	//	poke1 = new Pokeparada(punto1,"poke1", #[pokebola, superbola, pocion])
		repositorioPokeparada.create(poke1)
		repositorioPokeparada.importarDesdeJSON(json.getJSONPokeparadas)
		Assert.assertEquals(#[poke1], repositorioPokeparada.search("poke1"))
	}
	
	@Test(expected=typeof(BusinessException))
	def void elRepositorioPokeparadaRecibeUnJsonPeroLaPokeparadaNoExisteEntoncesTiraException() {
		repositorioPokeparada.agregarItems(ultrabola)
		repositorioPokeparada.importarDesdeJSON(json.getJSONPokeparadas)
	
	}

}
