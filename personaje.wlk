import wollok.game.*
import cultivos.*
import Extras.*

object personaje {
	var campo  = cultivos
	var refugio = granero
	var property position = game.center()
	const property image = "fplayer.png"

	method plantar(cultivo) {
		if (campo.posicionSinCultivos(self)){
	    cultivo.position(position)
		game.addVisual(cultivo)
		campo.nuevoCultivo(cultivo)
		game.removeVisual(self)
		game.addVisual(self)
	}
	else{
		game.say(self, "no junto plantas, podrian revelarse en mi contra")
	}
	}

	method regar(){
		if (campo.posicionConCultivos(self)){
		campo.cultivoEnPosicion(self.position()).serRegado()
		}
		 else {
			game.say(self, "ah, no hay cultivos para negar, el unico nabo soy yo")
	}
	}

method cosechar() {
	if (campo.posicionConCultivos(self)){
		campo.cultivoEnPosicion(self.position()).serCosechado()
		campo.sacarCultivo(campo.cultivoEnPosicion(self.position()))
	     refugio.
		}
		 else {
			game.say(self, "lo unico que puede ser cosechado aqui es mi alma")
	}
 }
}
