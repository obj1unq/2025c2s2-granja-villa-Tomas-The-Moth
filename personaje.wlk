import wollok.game.*
import cultivos.*
import Extras.*

object personaje {
	var campo  = campoDecultivos
	var refugio = granero
	var property position = game.center()
	var dinero = 0
	const property image = "fplayer.png"

  method ponerAspersor(){
	aspersorFactory.nuevoAspersor(position)
  }



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
	     refugio.guardarCultivo(campo.cultivoEnPosicion(self.position()))
		}
		 else {
			game.say(self, "no puedo cosechae nada")
	}
 }

 method venderCosechas(){
	if (self.enMercado()){
	dinero = dinero + refugio.precioDeCosecha()
    refugio.venderCosechas()
}
else{ game.say(self, "no estoy en un mercado")}
 }
method decirDineroYMercaderia(){
	game.say(self, "tengo" + dinero + "monedas y" + refugio.cultivosPlantados() + "plantas para vender")
}

method enMercado(){
	return campo.mercadosAca().any({mercadito => mercadito.position() == position})
}
}


