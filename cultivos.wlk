import wollok.game.*
import Extras.*

// campo --------------------------------------------------------------------------------------------------------------------------------------------------------
object cultivos {
	const cultivosPlantados = []


 method posicionConCultivos(cosa){
	 return  cultivosPlantados.map({cultivo => cultivo.position()}).contains(cosa.position())
	}

method posicionSinCultivos(cosa){
	 return  !self.posicionConCultivos(cosa)
	}

method cultivoEnPosicion(posicion){
	//devuleve el cultivo que está en la posición dada
	return cultivosPlantados.find({cultivo => cultivo.position() == posicion})
   
}

method nuevoCultivo(cultivo){
	cultivosPlantados.add(cultivo)
}

method sacarCultivo(cultivo){
	cultivosPlantados.remove(cultivo)
}
}

//cultivos --------------------------------------------------------------------------------------------------------------------------------------------------------
class Maiz {
	var property position = game.at(1, 1)
	var estado = baby // puede ser baby y adult
	method image() {return "corn_"+ estado +".png" }
	

	method serRegado(){
		estado = estado.siguienteAlRiego()
	}

	method serCosechado(){
		if (estado.puedeCosecharse()){
			game.removeVisual(self)
		}
		else{ game.say(self, "no daño a bebes, tengo moral")}
	}
		method valor(){
		return 150
	}
}


class Tomaco {
	var property position = game.at(2, 2)
	var campo = cultivos

	method image() {
		return "tomaco.png"
	}

	method serRegado(){
		if (self.haysiguienteArriba()){
			position = position.up(1)
		}
		else{
	 position = game.at(position.x(), 0)
		}
		}

	method haysiguienteArriba(){
		return position.y()!= 9
	}


	method serCosechado(){
		game.removeVisual(self)
	}

	method valor(){
		return 80
	}
}

class Trigo {
	var property position = game.at(3, 3)

	method image() {
	return "wheat_" + estado + ".png" 
	}
	var estado = 0  //puede ser 0,1,2,3,

	method serRegado(){
		if (estado >= 3){
			estado = 0
		}
		else{
		estado = estado +1
	}
}
   method serCosechado(){
	if (estado >= 2){
		 game.removeVisual(self)
	}
	else{
     game.say(self, "El trigo no parece maduro todavia, sigue peleando con gente en internet")
	}
   }
   	method valor(){
		return (estado - 1) * 100
}
// estados de edad de el maiz ---------------------------------------------- ----------------------------------------------------------------------------------------

object baby  {
	var planta = new Maiz()
  method siguienteAlRiego() {
  	return adult
  }
 method puedeCosecharse(){
	return false
 }

}

object adult  {
	
	method siguienteAlRiego(){
		return self
	}
 method puedeCosecharse(){
	return true
 }
}