package ar.edu.unsam.Grupo2

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.geodds.Point

@Accessors
@TransactionalAndObservable
class AreaRectangular implements ERepositorios {
	
	Point punto
	Point otroPunto	
	Point punto3
	Point punto4
	
	String descripcion
	
		
	
	new(Point unPunto, Point _otroPunto){
		
	
		punto = unPunto
		otroPunto = _otroPunto
	}
	
	
	def definirPuntos(){
		punto3 = new Point(punto.getX, otroPunto.getY)
		punto4 = new Point(otroPunto.getX, punto.getY)
			
	}
	def distance(){
		 punto.distance(punto4)
	}
	
	def calcularArea(){
		 punto.distance(punto4)* otroPunto.distance(punto3)
	}
	
	def getX1(){
		return punto.getX
	}
	
	def getX2(){
		return otroPunto.getX
	}
	
	def getY1(){
		return punto.getY
	}
	
	def getY2(){
		return otroPunto.getY
	}
	
	override esValida() {
	true
	}
	
	override setId(int _id) {
	
	}
	
	override getId() {
	id
	}
	
	override validacion(String valor) {
		true
	}
	
	
	

	
	

}
