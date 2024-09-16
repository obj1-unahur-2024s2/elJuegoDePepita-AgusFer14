import pepita.*
import comidas.*
import extras.*
import wollok.game.*

object tutorial1 {

	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
	}

}

object config {
	var property tiempo = 10000
	method configurarTeclas() {
		keyboard.left().onPressDo({
			if(0 < pepita.position().x())
			 pepita.irA(pepita.position().left(1))})
		keyboard.right().onPressDo({
			if(game.width()-1 > pepita.position().x())
			 pepita.irA(pepita.position().right(1))})
		keyboard.up().onPressDo({
			if(game.height()-1 > pepita.position().y())
			 pepita.irA(pepita.position().up(1))})
		keyboard.down().onPressDo({
			if(0 < pepita.position().y())
			 pepita.irA(pepita.position().down(1))})
		keyboard.m().onPressDo({
			self.cambiarSeguidor()
		})
		keyboard.t().onPressDo({
			game.onTick(tiempo, "TransportacionPepita", {pepita.teletrasportate()})
		})
		keyboard.p().onPressDo({game.removeTickEvent("TransportacionPepita")})
	}

	method cambiarSeguidor() {
	  const seguidorActual = pepita.seguidor()
	  const seguidorSiguiente = seguidorActual.siguiente()
	  seguidorSiguiente.position(seguidorActual.position())
	  game.removeVisual(seguidorActual)
	  game.addVisual(seguidorSiguiente)
	  pepita.seguidor(seguidorSiguiente)
	}

	method configurarColisiones() {
		game.whenCollideDo(pepita, { algo => algo.teEncontro(pepita)})
	}

}

