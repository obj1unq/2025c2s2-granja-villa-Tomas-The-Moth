import wollok.game.*
import cultivos.*
object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
    const cultivosPlantados = []

	method plantar(cultivo) {
		if (self.posicionSinCultivos()){

	    cultivo.position(position)
		game.addVisual(cultivo)
		cultivosPlantados.add(cultivo.position())
	}
	}

method posicionConCultivos(){
	return  cultivosPlantados.map({cultivo => cultivo.position()}).contains(position)
	}

method posicionSinCultivos(){
	return  !cultivosPlantados.map({cultivo => cultivo.position()}).contains(position)
	}

	method regar(){
		if (self.posicionConCultivos()){
		cultivosPlantados.find({cultivo => cultivo.position() == position}).serRegado()
		} else {
			game.say(self, "ah, no hay cultivos para negar, el unico nabo soy yo")
	}
	}

}