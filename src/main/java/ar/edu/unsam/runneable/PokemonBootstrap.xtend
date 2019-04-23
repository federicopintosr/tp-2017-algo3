package ar.edu.unsam.runneable

import ar.edu.unsam.Grupo2.AreaRectangular
import ar.edu.unsam.Grupo2.Criador
import ar.edu.unsam.Grupo2.Especie
import ar.edu.unsam.Grupo2.Jugador
import ar.edu.unsam.Grupo2.Luchador
import ar.edu.unsam.Grupo2.Pocion
import ar.edu.unsam.Grupo2.Pokebola
import ar.edu.unsam.Grupo2.RepositorioArea
import ar.edu.unsam.Grupo2.RepositorioEspecie
import ar.edu.unsam.Grupo2.RepositorioRepositorio
import ar.edu.unsam.Grupo2.Tipo
import java.util.List
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.geodds.Point
import ar.edu.unsam.Grupo2.Pokemon
import ar.edu.unsam.Grupo2.RepositorioPokemon
import ar.edu.unsam.Grupo2.RepositorioJugador
import ar.edu.unsam.Grupo2.Pokeparada
import ar.edu.unsam.Grupo2.RepositorioPokeparada
import ar.edu.unsam.Grupo2.Rival
import ar.edu.unsam.Grupo2.RepositorioRival

class PokemonBootstrap extends CollectionBasedBootstrap {

	override run() {
		var Criador criador
		var Luchador luchador
		var List<Jugador> unaListaDeJugadores = newArrayList
		var Jugador lucho
		var Rival pipa
		var Especie pikachu
		var Especie charmander
		var Especie charmeleon
		var Especie raichu
		var Especie arceus
		var Tipo fuego
		var Tipo hielo
		var Tipo agua
		var Tipo tierra
		var Tipo normal
		var Pokemon pikaPika
		var Pokemon charmy
		var Pokemon raichito
		var Pokemon charmel 
		var Pokemon arceus0
		var Pocion pocion
		var Pocion superpocion
		var Pokebola pokebola
		var Pokebola ultrabola
		var Point punto11
		var Point punto22
		var AreaRectangular area
		var AreaRectangular area2
		var Tipo electricidad
		var Pokeparada pokeparada
		

		fuego = new Tipo(#[hielo], #[tierra])
		hielo = new Tipo(#[agua], #[tierra])
		tierra = new Tipo(#[agua], #[hielo])
		agua = new Tipo(#[fuego], #[hielo])
		electricidad = new Tipo(#[fuego], #[hielo])
		normal = new Tipo(#[agua,fuego,hielo,agua], #[])

		raichu = new Especie(20, 200, 25, null, #[tierra], 10, 2, "raichu", "es pequeño")
		pikachu = new Especie(10, 100, 2, raichu, #[electricidad], 10, 1, "pikachu", "su cola es un rayo")
		charmeleon = new Especie(10, 100, 36, raichu, #[fuego], 10, 5, "charmeleon", "fgdfs")
		charmander = new Especie(5, 50, 16, charmeleon, #[hielo, agua], 10, 4, "charmander", "asd123")
		arceus = new Especie(450, 800, 25, charmander, #[normal], 10, 4, "arceus", "El mas Poderoso de los Pokemon Legendarios")
		punto11 = new Point(-34.577140, -58.581818)
		punto22 = new Point(-22.903514, -43.167868)
		arceus0 = new Pokemon(1500,arceus,punto22,"m")
		arceus0.setNombre("Arceus")
		arceus0.setSalud(3000)
		pikaPika = new Pokemon(100, pikachu, punto11, "m")
		pikaPika.setNombre("pikaPika")
		pikaPika.setSalud(50)
		electricidad.setNombre("electricidad")
		charmy = new Pokemon(50, charmander, punto22, "f")
		charmy.setNombre("Charmy")
		charmy.setSalud(10)
		raichito = new Pokemon(150, raichu, punto11, "m")
		raichito.setNombre("Raichito")
		raichito.setSalud(100)
		charmel = new Pokemon(700, charmeleon, punto11, "m")
		charmel.setSalud(300)
		charmel.setNombre("Charmel")
		pocion = new Pocion(50, 20, "pocion")
		superpocion = new Pocion(100,500,"superpocion")
		pokebola = new Pokebola(80, 0, "pokebola")
		ultrabola = new Pokebola(200, 0, "ultrabola")
		pokebola.setCantidad(2)
		ultrabola.setCantidad(1)
		luchador = new Luchador()
		pokeparada= new Pokeparada(punto11,"Palomino")
		
		criador = new Criador()
		lucho = new Jugador(luchador, punto11)
		pipa = new Rival(criador,punto11,charmy,200,50)
		lucho.equipo.add(pikaPika)
		lucho.equipo.add(charmy)
		lucho.deposito.add(raichito)
		pipa.equipo.add(charmy)
		lucho.setNombre("lucho")
		pipa.setNombre("pipa")
		lucho.pokebolas.add(pokebola)
		lucho.pokebolas.add(ultrabola)
		lucho.pociones.add(pocion)
		lucho.pociones.add(superpocion)
		lucho.setNpc(false)
		pipa.setNpc(true)
		unaListaDeJugadores = #[lucho, pipa]
		area = new AreaRectangular(punto11, punto22)
		area.setDescripcion("UNSAM")
		area2 = new AreaRectangular(punto11, punto22)
		area2.setDescripcion("Facultad")
		RepositorioArea.instance.create(area)
		RepositorioArea.instance.create(area2)
		RepositorioEspecie.instance.create(pikachu)
		RepositorioEspecie.instance.create(charmeleon)
		RepositorioEspecie.instance.create(arceus)
		RepositorioPokemon.instance.create(charmel)
		RepositorioPokemon.instance.create(arceus0)
		RepositorioPokemon.instance.create(raichito)
		RepositorioJugador.instance.create(lucho)
		RepositorioRival.instance.create(pipa)
		RepositorioPokeparada.instance.create(pokeparada)
		RepositorioEspecie.instance.setDescripcion("RepoEspecie")
		RepositorioRepositorio.instance.create(RepositorioEspecie.instance)

	}

}
