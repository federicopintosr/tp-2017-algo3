package ar.edu.unsam.Grupo2

import org.uqbar.geodds.Point
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import ar.edu.unsam.exceptions.BusinessException

@Accessors
class Pokeparada implements ERepositorios{

	Point ubicacion
	String nombre
	var List<Item> itemsDisponibles = newArrayList
	int id

	new() {
	}

	new(Point _ubicacion, String unNombre) {
		ubicacion = _ubicacion
		nombre = unNombre
		
	}


	def puedeComprarPocion(Mezcla unaMezcla, double monto) {
		if (!itemsDisponibles.contains(unaMezcla)) {
			throw new BusinessException("No se encuentra este item en esta Pokeparada")
		}
		monto >= unaMezcla.valor

	}
	
	
	def puedeComprarIngrediente(Ingrediente unIngrediente, double monto) {
		if (!itemsDisponibles.contains(unIngrediente)) {
			throw new BusinessException("No se encuentra este item en esta Pokeparada")
		}
		monto >= unIngrediente.valor

	}

	def puedeComprarPokebola(Pokebola unaPokebola, double monto) {
		if (!itemsDisponibles.contains(unaPokebola)) {
			throw new BusinessException("No se encuentra este item en esta Pokeparada")
		}
		monto >= unaPokebola.valor

	}

	override esValida() {
		if (ubicacion === null || nombre === null || itemsDisponibles === null) {
			throw new BusinessException("No es valido")
		}
		true

	}

	def update(Pokeparada unaPokeparada) {
		ubicacion = unaPokeparada.ubicacion
		nombre = unaPokeparada.nombre
		itemsDisponibles = unaPokeparada.itemsDisponibles
	}

	def validarNombre(String _valor) {
		nombre.contains(_valor)
	}

	def validarItems(String _valor) {
		(itemsDisponibles.map[item|item.nombre]).contains(_valor)

	}

	override validacion(String _valor) {
		this.validarNombre(_valor) || this.validarItems(_valor)
	}

}
