import cultivos.*
import personaje.*
import wollok.game.*
object granero {
const property cultivosGuardados = []


method guardarCultivo (cultivo) {
    cultivosGuardados.add(cultivo)
}

method precioDeCosecha(){
    return cultivosGuardados.sum({cultivo => cultivo.valor()})
}

method venderCosechas(){
    cultivosGuardados.clear()
}

}
//--------------



class Aspersor {
    var property position = game.center()
    var campo = campoDecultivos 
    method image() {
        return "aspersor.png"
    }

   const alrededores = #{position.up(1), position.down(1), position.left(1), position.right(1), position.up(1).right(1),
        position.up(1).left(1), position.down(1).right(1), position.down(1).left(1)}
    

    method regarAlrededores(){ 
        alrededores.forEach({direccion => campo.regarEnPosicionSiHay(direccion)})

    }
}

object aspersorFactory{
const property aspersoresPuestos = []

method crearAspersor(direccionDada){
   return new Aspersor(position = direccionDada)
}
method nuevoAspersor(direcciónDada) {
		
			const aspersor = self.crearAspersor(direcciónDada)
			game.addVisual(aspersor)
			aspersoresPuestos.add(aspersor)

	}

method regarTodos(){
    aspersoresPuestos.forEach({asperso => asperso.regarAlrededores()})
}
}

// ----- mercados
class Mercado {
    var dinero = 1000
    var property position = game.center()
    const property mercaderias =[]
    var vendedor = personaje
    method image(){
        return "market.png"
    }
    method comprar(gastos,mercaderia){
        if (dinero >= gastos){
        dinero=dinero - gastos
        mercaderias.add(mercaderia)
        }
        else {game.say(self, "perdona flaca, no nos queda plata")
        }
    }
    
    method estaElVenderdorAca(){
   return vendedor.position() == position
    }
    }
