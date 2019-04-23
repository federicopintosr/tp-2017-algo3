package ar.edu.unsam.Grupo2

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import ar.edu.unsam.exceptions.BusinessException
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class Especie implements ERepositorios{

	Integer puntosAtaqueBase
	Integer puntosSaludBase
	Integer nivelParaEvolucion
	Integer velocidad
	Integer numero
	String nombre
	String descripcion
	Especie proxEvo
	Pokemon pokemon
	List<Tipo> tipos
	int evolucion
	int id

	new() {
	}

	new(Integer _setPuntosAtaqueBase, Integer _setPuntosSaludBase, Integer _nivelParaEvolucion, Especie _proxEvo,
		List<Tipo> _tipos, Integer _velocidad, Integer _numero, String _nombre, String _descripcion) {
		puntosAtaqueBase = _setPuntosAtaqueBase
		puntosSaludBase = _setPuntosSaludBase
		nivelParaEvolucion = _nivelParaEvolucion
		proxEvo = _proxEvo
		tipos = _tipos
		velocidad = _velocidad
		numero = _numero
		nombre = _nombre
		descripcion = _descripcion
	}

	def setNumeroEspecieEvolucion(int _evolucion) {
		evolucion = _evolucion
	}

	def boolean esDeTipo(Tipo unTipo) {
		tipos.contains(unTipo)

	}

	def boolean soyMasFuerte(Especie unaEspecie) {
		var fuertess = tipos.map[fuertes].flatten()
		fuertess.exists(tipo|unaEspecie.esDeTipo(tipo))
	}

	def boolean soyMasResistente(Especie unaEspecie) {
		var resistenciaa = tipos.map[resistentes].flatten()
		resistenciaa.exists(tipo|unaEspecie.esDeTipo(tipo))
	}

	override boolean esValida() {
		if (puntosAtaqueBase === null || puntosSaludBase === null || nivelParaEvolucion === null || proxEvo === null ||
			tipos === null || velocidad === null || numero === null || nombre === null || descripcion === null) {
			throw new BusinessException("No es valido")
		}
		true
	}

	def update(Especie especie) {
		puntosAtaqueBase = especie.puntosAtaqueBase
		puntosSaludBase = especie.puntosSaludBase
		nivelParaEvolucion = especie.nivelParaEvolucion
//		proxEvo = especie.proxEvo
//		tipos = especie.tipos
		velocidad = especie.velocidad
		numero = especie.numero
		nombre = especie.nombre
		descripcion = especie.descripcion
		return this
	}
	

	def validarNumero(String _valor) {
		numero.toString() == _valor
	}

	def validarNombre(String _valor) {
		nombre.contains(_valor)
	}

	def validarDescripcion(String _valor) {
		descripcion.contains(_valor)
	}

	override validacion(String valor) {
		this.validarNumero(valor) || this.validarNombre(valor) || this.validarDescripcion(valor)
	}


}
