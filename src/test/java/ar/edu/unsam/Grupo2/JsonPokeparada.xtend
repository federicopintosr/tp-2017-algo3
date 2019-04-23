package ar.edu.unsam.Grupo2

import com.eclipsesource.json.JsonArray
import com.eclipsesource.json.JsonObject
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JsonPokeparada {
	

	def JsonArray getJSONPokeparadas() {
		
		var double x = -34.568258
		var double y = -58.532522
		var JsonArray jsonPokeparadas = new JsonArray()
		var JsonObject poke1 = new JsonObject()
		var JsonArray itemsDisponibles = new JsonArray().add("ultrabola")
		poke1.add("x",x)
		poke1.add("y",y)		
		poke1.add("nombre", "poke1")
		poke1.add("itemsDisponibles", itemsDisponibles)

		jsonPokeparadas.add(poke1)

		jsonPokeparadas
	}
	
	
	
}