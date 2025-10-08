import cultivos.*
import personaje.*
object granero {
const property cultivosGuardados = []


method guardarCultivo (cultivo) {
    cultivosGuardados.add(cultivo)
}

method precioDeCosecha(){
    return cultivosGuardados.sum({cultivo => cultivo.valor()})
}

method venderCultivos(){
    cultivosGuardados.clear()
}

}