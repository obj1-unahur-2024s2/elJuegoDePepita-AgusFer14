import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.at(0 , 2)
	var seguidor = silvestre
	var property image = "pepita.png"

	method seguidor() = seguidor

	method seguidor(unSeguidor) {
	  seguidor = unSeguidor
	}

	/*method image() {
		return if (self.estaEnElNido()) "pepita-grande.png" else "pepita.png"
		return if (self.position() == silvestre.position()) "pepita-gris.png" else "pepita.png"
	}*/

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
		seguidor.position(game.at(position.x(), seguidor.position().y()))
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		
		return self.position() == nido.position()
	}

	method teletrasportate() {
	  self.position(game.at(0.randomUpTo(game.width()-1), 0.randomUpTo(game.height()-1)))
	}
}

