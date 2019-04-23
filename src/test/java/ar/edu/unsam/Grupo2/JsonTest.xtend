package ar.edu.unsam.Grupo2
import com.eclipsesource.json.JsonArray
import com.eclipsesource.json.JsonObject
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class JsonTest {
	

	def JsonArray getJSONEspecies() {
		var JsonArray jsonEspecies = new JsonArray()
		var JsonObject pikachu = new JsonObject()
		var JsonArray tiposPikachu = new JsonArray().add("fuego").add("tierra")
		pikachu.add("numero", 1)
		pikachu.add("nombre", "pikachu")
		pikachu.add("puntosAtaqueBase", 10)
		pikachu.add("puntosSaludBase", 15)
		pikachu.add("descripcion", "A pikachu le gusta pelear.")
		pikachu.add("tipos", tiposPikachu)
		pikachu.add("velocidad",7)
		pikachu.add("evolucion", 2)
		pikachu.add("nivelEvolucion", 16)
		jsonEspecies.add(pikachu)

		jsonEspecies
	}
	
	
	
}