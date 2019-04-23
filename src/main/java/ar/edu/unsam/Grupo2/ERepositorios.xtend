package ar.edu.unsam.Grupo2



interface ERepositorios {
	
	def boolean esValida()
	def void setId(int _id)
	def int getId ()	
	def boolean validacion(String valor)
}