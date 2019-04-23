package ar.edu.unsam.Grupo2

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point
import ar.edu.unsam.exceptions.BusinessException

@Accessors
class Jugador implements ERepositorios {

	int numero
	String nombre
	String descripcion
	var double dinero = 10000
	int experiencia = 0
	var int combatesGanados = 0
	static int experienciaGanadaPorCombate = 300
	static int sumaExperienciaPorEvolucion = 200
	static int experienciaPorAtraparNueva = 600
	static int experienciaPorAtrapar = 100
	var int pokemonesQueEvolucione
	var List<Jugador> amigosActivos = newArrayList
	var List<Jugador> amigosPendientes = newArrayList
	var List<Pokebola> pokebolas = newArrayList
	var List<Mezcla> pociones = newArrayList
	var List<Ingrediente> ingredientes = newArrayList
	var List<Pokemon> equipo = newArrayList
	var List<Pokemon> deposito = newArrayList
	var List<Accion> acciones = newArrayList
	var Nivel nivel = new Nivel()
	var int prenivel
	val multiplo = 5
	var boolean npc
	public static var random = [|return Math.random]
	var int id

	TipoDeEntrenador tipoDeEntrenador
	Point ubicacionJugador
	Luchador luchador

	ObserverJugador observerJugador = new ObserverJugador()

	new() {
	}

	new(TipoDeEntrenador _tipoDeEntrenador, Point _ubicacion) {
		tipoDeEntrenador = _tipoDeEntrenador
		ubicacionJugador = _ubicacion

	}

	def enviarSolicitudDeAmistad(Jugador unJugador) {
		amigosPendientes.add(unJugador)
		unJugador.amigosPendientes.add(this)

	}

	def recibirSolicitudDeAmistad(Jugador unJugador) {
	}

	def aceptarSolicitudDeAmistad(Jugador unJugador) {
		if (amigosPendientes.contains(unJugador)) {
			amigosPendientes.remove(unJugador)
			unJugador.amigosPendientes.remove(unJugador)
			amigosActivos.add(unJugador)
			unJugador.amigosActivos.add(unJugador)
		} else {
			throw new BusinessException("El usuario no ha enviado una Solicitud")
		}

	}

	def rechazarSolicitudDeAmistad(Jugador unJugador) {
		if (amigosPendientes.contains(unJugador)) {
			amigosPendientes.remove(unJugador)
			unJugador.amigosPendientes.remove(unJugador)
		} else {
			throw new BusinessException("El usuario no ha enviado una Solicitud")
		}
	}

	def eliminarAmigo(Jugador unJugador) {
		amigosActivos.remove(unJugador)
		unJugador.amigosActivos.remove(unJugador)
	}

	def recibirNoti(String unString) {
		print(unString)
	}

	def update(Jugador unJugador) {
		tipoDeEntrenador = unJugador.tipoDeEntrenador
		ubicacionJugador = unJugador.ubicacionJugador
	}

	def getNivel() {
		nivel.getNivel(experiencia)
	}

	def cambiarTipo(TipoDeEntrenador unTipo) {
		tipoDeEntrenador = unTipo
	}

	def sumaMachoEquipo() {
		(equipo.filter[sexo.equals("m")]).size
	}

	def sumaMachoDeposito() {
		(deposito.filter[sexo.equals("m")]).size
	}

	def cantidadMachos() {
		this.sumaMachoEquipo + this.sumaMachoDeposito
	}

	def distanciaConUnPokemon(Pokemon pokemon) {
		(pokemon.ubicacion).distance(ubicacionJugador)

	}

	def distanciaConUnaPokeparada(Pokeparada unaPokeparada) {
		(unaPokeparada.ubicacion).distance(ubicacionJugador)
	}

//........................................LISTA POKEMON.....................................................//
	def equipoLleno() {
		equipo.size == 6
	}

	def agregarPokemon(Pokemon pokemon) {
		if (this.equipoLleno)
			deposito.add(pokemon)
		else
			equipo.add(pokemon)

	}

	def esNuevaEspecieAgregado(Pokemon unpokemon) {
		if ((equipo.map[especie]).contains(unpokemon.especie) || (deposito.map[especie]).contains(unpokemon.especie))
			false
		else
			true

	}

	def cantidadEspeciesAtrapadas() {
		equipo.map[especie].size + deposito.map[especie].size // falta filtrar las que son iguales
	}

	def cantidadPokemonesAtrapados() {
		equipo.size + deposito.size
	}

	def tieneColeccionBalanceada() {
		((this.cantidadMachos()) <= (0.55 * this.cantidadPokemonesAtrapados)) && (this.cantidadMachos() >=
			(0.45 * this.cantidadPokemonesAtrapados))
	}

	def cantidadPokemonesConMasDeNivel20() {
		(equipo.filter[pokemon|pokemon.nivel > 20]).size

	}

//.............................. ATRAPAR ....................................................................//
	def puedoAtrapar(Pokemon pokemon) {
		distanciaConUnPokemon(pokemon) < 0.1
	}

	def boolean puedeAtacar(Jugador _entrenador) {
		ubicacionJugador.distance(_entrenador.getUbicacionJugador()) < 0.005
	}

	def chancesDeAtrapar(Pokebola unaPokebola) {
		(tipoDeEntrenador.chancesDeAtraparPoke(this) * getNivel) * unaPokebola.chances
	}

	def loAtrapa(Pokemon pokemon, Pokebola unaPokebola) {
		val valorRandom = random.apply()
		valorRandom <= (chancesDeAtrapar(unaPokebola) / (chancesDeAtrapar(unaPokebola) + pokemon.chancesDeEscapar))
	}

	def atraparPokemon(Pokemon pokemon, Pokebola unaPokebola) {
		
		prenivel = this.getNivel
		this.agregarPokemon(pokemon)
		pokebolas.remove(unaPokebola)
		RepositorioPokemon.getInstance.delete(pokemon)
		this.sumarExperienciaPorAtrapar(experienciaPorAtrapar)
		
		
		}
//		prenivel = this.getNivel
//		if (puedoAtrapar(pokemon) && loAtrapa(pokemon, unaPokebola)) {
//			if (esNuevaEspecieAgregado(pokemon)) {
//				this.agregarPokemon(pokemon)
//				this.sumarExperienciaPorAtrapar(experienciaPorAtraparNueva)
//				this.cambioNivel
//				pokebolas.remove(unaPokebola)
//			} else {
//				agregarPokemon(pokemon)
//				this.sumarExperienciaPorAtrapar(experienciaPorAtrapar)
//				this.cambioNivel
//			}
//		} else
//			pokebolas.remove(unaPokebola)
//			throw new BusinessException("No pudo atraparlo, intente de nuevo")
//	}

	def ejecutarAcciones() {
		observerJugador.ejecutarAcciones(this)

	}

	def cambioNivel() {
		if (prenivel != this.getNivel) {
			observerJugador.observaYNotifica(this)

		}
	}

	def sumarExperienciaPorAtrapar(int unEntero) {
		experiencia += unEntero

	}

	// ............................ COMBATE ................................................................//
	def chancesEntrenador(Pokemon miPokemon) {
		if (tipoDeEntrenador.esExperto(this)) {
			miPokemon.getPuntosDeAtaque * 0.20
		} else
			0
	}

	def chancesPropias(Pokemon miPokemon, Pokemon pokemonRival) {
		chancesEntrenador(miPokemon) + miPokemon.chancesFuerte(pokemonRival) + miPokemon.chancesResistente(pokemonRival)
	}

	def gana(Pokemon miPokemon, Rival unRival) {
		val valorRandom = random.apply()
		valorRandom <= calculoParaGanar(miPokemon, unRival)
	}

	def calculoParaGanar(Pokemon miPokemon, Rival unRival) {
		chancesPropias(miPokemon, unRival.pokemonRival) /
			(chancesPropias(miPokemon, unRival.pokemonRival) + unRival.chancesPropias(unRival.pokemonRival, miPokemon))

	}

	def combate(Pokemon miPokemon, Rival unRival, double unaApuesta) {
		
		combatesGanados += 1
		this.sumaDineroPorCombateGanado(unaApuesta)
		miPokemon.recibeDaño(unRival.pokemonRival)
		this.sumaExperienciaPorCombateGanado()
		miPokemon.sumaExperiencia(unRival.pokemonRival) 
		
		}
		
//		prenivel = this.getNivel
//		if (perteneceAlEquipo(miPokemon)) {
//			if (gana(miPokemon, unRival)) {
//				combatesGanados += 1
//				this.sumaDineroPorCombateGanado(unaApuesta)
//				miPokemon.recibeDaño(unRival.pokemonRival)
//				this.sumaExperienciaPorCombateGanado()
//				this.sumaExperienciaPorEvolucion(miPokemon)
//				miPokemon.sumaExperiencia(unRival.pokemonRival)
//				tipoDeEntrenador.sumaExperienciaAdicional(this, unRival)
//				this.cambioNivel
//			} else
//				this.pierdoDineroPorCombatePerdido(unaApuesta)
//			miPokemon.quedaKO
//		} else
//			throw new BusinessException("El pokemon elegido no pertenece al equipo")
//	}

	def sumaDineroPorCombateGanado(double unaApuesta) {
		dinero += unaApuesta
	}

	def pierdoDineroPorCombatePerdido(double unaApuesta) {
		dinero -= unaApuesta
	}

	def pierdoDinero(double dinerillo) {
		if (dinero <= 0) {
			throw new BusinessException("El jugador no puede perder dinero, porque no tiene")
		} else
			dinero -= dinerillo
	}

	def sumaExperienciaPorCombateGanado() {
		experiencia += experienciaGanadaPorCombate
	}

	def sumaExperienciaPorEvolucion(Pokemon pokemon) {
		if (pokemon.puedoEvolucionar)
			experiencia += sumaExperienciaPorEvolucion
		pokemonesQueEvolucione += 1
	}

	def perteneceAlEquipo(Pokemon unPokemon) {
		equipo.contains(unPokemon)
	}

//..........................COMPRAR EN POKEPARADA................................................................................................//	
	def agregarPokebola(Pokebola unaPokebola) {
		pokebolas.add(unaPokebola)
	}

	def agregarPocion(Mezcla unaMezcla) {
		pociones.add(unaMezcla)
	}

	def agregarIngrediente(Ingrediente unIngrediente) {
		ingredientes.add(unIngrediente)
	}

	def cantidadPokebolas() {
		pokebolas.size
	}

	def comprarPokebolaEnPokeparada(Pokeparada unaPokeparada, Pokebola unaPokebola) {
		if (distanciaConUnaPokeparada(unaPokeparada) < 0.1 && unaPokeparada.puedeComprarPokebola(unaPokebola, dinero)) {
			agregarPokebola(unaPokebola)
			dinero -= unaPokebola.valor
		}
	}

	def comprarPocionEnPokeparada(Pokeparada unaPokeparada, Mezcla unaMezcla) {
		if (distanciaConUnaPokeparada(unaPokeparada) < 0.1 && unaPokeparada.puedeComprarPocion(unaMezcla, dinero)) {
			agregarPocion(unaMezcla)
			dinero -= unaMezcla.valor
		}
	}

	def comprarIngredienteEnPokeparada(Pokeparada unaPokeparada, Ingrediente unIngrediente) {
		if (distanciaConUnaPokeparada(unaPokeparada) < 0.1 &&
			unaPokeparada.puedeComprarIngrediente(unIngrediente, dinero)) {
			agregarIngrediente(unIngrediente)
			dinero -= unIngrediente.precio
		}
	}

	def tengoPociones() {
		!pociones.isEmpty
	}

	def usarPocion(Pokemon unPokemon, Mezcla unaMezcla) {
		if (tengoPociones)
			unPokemon.curarPokemon(unaMezcla.curar(unPokemon))
	}

	def tengoIngredientes() {
		!ingredientes.isEmpty
	}

	def usarIngrediente(Pokemon unPokemon, Ingrediente unIngrediente) {
		if (tengoIngredientes)
			unPokemon.curarPokemon(unIngrediente.curar(unPokemon))
	}

	def curarPokemonEnPokeparada(Pokeparada unaPokeparada, Pokemon unPokemon) {
		if (distanciaConUnaPokeparada(unaPokeparada) < 0.1) {
			unPokemon.salud = unPokemon.getPuntosDeSaludMaxima
		}
	}

	def curarEquipo(Pokeparada _pokeparada) {
		this.regenerarSaludEquipo()

	}

	def regenerarSaludEquipo() {
		equipo.forEach[pokemon|pokemon.regenerarSalud()]
	}

	def cambiarPokemonADeposito(Pokemon unPokemon) {
		equipo.remove(unPokemon)
		deposito.add(unPokemon)
	}

	def cambiarPokemonAEquipo(Pokemon unPokemon) {
		if (equipoLleno) {
			throw new BusinessException("Su equipo esta lleno, no puede cambiar pokemon de deposito a inventario")
		} else {
			deposito.remove(unPokemon)
			equipo.add(unPokemon)
		}

	}

	override esValida() {
		true
	}

	override validacion(String valor) {
		true
	}

	// ---------------------MOVIMIENTOS-------------------------------
	def irNorte() {
		ubicacionJugador.y = ubicacionJugador.y + 0.001
	}

	def irSur() {
		ubicacionJugador.y = ubicacionJugador.y - 0.001
	}

	def irEste() {
		ubicacionJugador.x = ubicacionJugador.x + 0.001
	}

	def irOeste() {
		ubicacionJugador.x = ubicacionJugador.x - 0.001
	}

}
