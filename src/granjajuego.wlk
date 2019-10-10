 import wollok.game.*
import hector.*
import cultivos.*
import oso.*
import direcciones.*

object granjajuego {
	var personajeActual = hector
	
	method configurarTeclado(){
		keyboard.s().onPressDo({game.say(hector, "hola gente")})
	keyboard.o().onPressDo({hector.position(new Position(x = 0, y = 0))})
	keyboard.m().onPressDo({ hector.plantarMaiz() })
	keyboard.t().onPressDo({ hector.plantarTrigo() })
	keyboard.r().onPressDo({ hector.regarPlanta() })
	keyboard.c().onPressDo({ hector.cosecharPlanta() })
	keyboard.p().onPressDo({ 
		game.say(hector, 
		"tengo cosechadas " + hector.cantidadDePlantasCosechadas() + "plantas"
		)
	})
	
	self.configurarMovimiento()
	}
	
	method configurarMovimiento(){
		keyboard.up().onPressDo({
			if(personajeActual.position().y() < game.height() - 1){
				personajeActual.position(personajeActual.position().up(1))
			}
		})
		keyboard.down().onPressDo({
			if(personajeActual.position().y() > 0){
				personajeActual.position(personajeActual.position().down(1))
			}
		})
		keyboard.left().onPressDo({
			if(personajeActual.position().x() > 0){
				personajeActual.position(personajeActual.position().left(1))
			}
		})
		keyboard.right().onPressDo({
			if(personajeActual.position().x() < game.width() - 1){
				personajeActual.position(personajeActual.position().right(1))
			}
		})
	}
	
	method configurarPersonajes(){
		game.addVisual(hector)
		game.addVisual(oso)
	}	
	
	method configurarColisiones(){
		game.whenCollideDo(oso,{objeto => objeto.teChocoElOso()})
	}
	
	method configurarAcciones(){
		game.onTick(1000,"movimientoOso",{oso.moveteAlAzar()})
	
		
	}
}
