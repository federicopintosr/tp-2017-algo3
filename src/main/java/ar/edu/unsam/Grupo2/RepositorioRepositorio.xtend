package ar.edu.unsam.Grupo2

class RepositorioRepositorio extends Repositorio<Repositorio> {

	static RepositorioRepositorio instance

	private new() {
	}

	def static getInstance() {
		if (instance === null) {
			instance = new RepositorioRepositorio
		}
		instance
	}

	override actualizarElemento(Repositorio _elemento, Repositorio _otroElemento) {}

	override esValida() { true }

	override validacion(String valor) { true }

}
