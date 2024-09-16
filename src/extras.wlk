import comidas.*
import pepita.*
import wollok.game.*

object nido {

	method image() {
		return "nido.png"
	}
	
	var property position = game.at(9, 9)
	//var property position = game.at(game.width()-1, game.height()-1)

	method teEncontro(conLoQueChoco) {
		conLoQueChoco.image("pepita-grande.png")
	}
}

object silvestre {
	
	method image() {
		return "silvestre.png"
	}

	var property position = game.origin()

	method siguiente() = manzana

	method teEncontro(conLoQueChoco) {
	  conLoQueChoco.image("pepita-gris.png")
	}
}
