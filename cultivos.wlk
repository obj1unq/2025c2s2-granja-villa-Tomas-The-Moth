import wollok.game.*

class Maiz {
	var property position = game.at(1, 1)
	
	var property image =  "corn_baby.png"
	

	method serRegado(){
		image = "corn_adult.png"
	}
}

class Tomaco {
	var property position = game.at(2, 2)
	
	method image() {
		return "tomaco_baby.png"
	}

}

class Trigo {
	var property position = game.at(3, 3)
	
	method image() {
		return "wheat_0.png"
	}
}

