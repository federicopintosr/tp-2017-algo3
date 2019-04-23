package ar.edu.unsam.Grupo2

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point
import org.uqbar.commons.model.Entity

@Accessors
class Pokemon implements ERepositorios{

	var double experiencia	
	Point ubicacion
	Especie especie
	double porcentajeDeChancesFuertes = 0.25
	double porcentajeDeChancesResistentes = 0.10
	char sexo
	var double salud 
	int id
	String nombre
	
	new (){}
	
	new(double _experiencia, Especie _especie, Point _punto, char _sexo) {
		experiencia = _experiencia
		especie = _especie
		ubicacion = _punto
		sexo = _sexo

	}

	def int getNivel() {
		((Math.sqrt(100 * (2 * experiencia + 25 )) + 50) / 100).intValue
	}

	def getPuntosDeAtaque() {
		getNivel * especie.puntosAtaqueBase
	}
	
	def getPuntosDeSaludMaxima() {
		getNivel * especie.puntosSaludBase
		
	}
	def inicializaSalud(){
		salud=getPuntosDeSaludMaxima
	}

	def calculoDistancia(Point otroPunto) {
		otroPunto.distance(ubicacion)
	}

	def puedoEvolucionar() {		
		getNivel >= especie.nivelParaEvolucion
	}
	
	def quedaKO(){
		salud = 0
	}

	def evolucionar() {
		if (this.puedoEvolucionar) {
			especie = especie.proxEvo
		}
	}

	def soyFuerteContra(Pokemon unPokemon) {
		especie.soyMasFuerte(unPokemon.especie)
	}

	def soyResistenteContra(Pokemon unPokemon) {
		especie.soyMasResistente(unPokemon.especie)
	}

	def moverse(Point otroPunto) {
		ubicacion = otroPunto
	}

//.....................................chances.........................................................

	def chancesDeEscapar() {
		nivel * (1 + especie.velocidad / 10 )

	}

	def chancesFuerte(Pokemon pokemonRival) {
		if (soyFuerteContra(pokemonRival)) {
			getPuntosDeAtaque * porcentajeDeChancesFuertes
		} else
			0
	}
	def chancesResistente(Pokemon pokemonRival) {
		if (soyResistenteContra(pokemonRival)) {
			getPuntosDeAtaque * porcentajeDeChancesResistentes
		} else
			0
	}
	
//............................................Combate - daños y sumar experiencia......................................................
	
	def dañoRecibido(Pokemon unPokemonRival) {
		puntosDeSaludMaxima * (puntosDeAtaque / (puntosDeAtaque + unPokemonRival.puntosDeAtaque))
		
	}
	def recibeDaño(Pokemon unPokemon) {
		salud -= dañoRecibido(unPokemon)
	}
	
	def sumaExperiencia(Pokemon unPokemonRival){
		experiencia += calculaExperienciaAdicional(unPokemonRival)
		evolucionar()	
	}
	def calculaExperienciaAdicional(Pokemon unPokemonRival){
		0.10 * (unPokemonRival.experiencia)
	}
	
	def curarPokemon(double ValorDeLaPocion){
		salud += ValorDeLaPocion	
	}
	
	
	
	override esValida() {
		return true
	}
	
	override validacion(String valor) {
		return true
	}
	
	def regenerarSalud() {
		this.salud = puntosDeSaludMaxima
		}
	
	}
