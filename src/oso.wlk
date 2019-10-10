import wollok.game.*
import direcciones.*


object oso {
	var property position = new Position(x = 3, y = 7)
	
	method image() = "oso.jpg"
	
	method moverEnDireccion(direccion){
		self.position(direccion.siguientePosicion(self.position()))
	}
	method moveteAlaIzquierda(){
		if (position.x() > 0){
			position = position.left(1)
		}
	}
	
	method moveteAlaDerecha(){
		if (position.x() > 0){
			position = position.right(1)
		}
	}
	
	method moveteHaciaArriba(){
		if (position.y() < game.height() - 1){
			position = position.up(1)
		}
	}
	
	method moveteHaciaAbajo(){
		if (position.x() > game.height()-1){
			position = position.up(1)
		}
	}
	method mover(direccion){
		position = direccion.siguientePosicion(position)	
	}	
	
	method moveteAlAzar(){
		var dado = 1.randomUpTo(5).truncate(0)
		
		if(dado == 1){	
			self.mover(oeste)
			//self.moveteAlaIzquierda()
		} else if(dado == 2 ){
			self.mover(norte)
			//self.moveteHaciaArriba(){}
		}else if (dado == 3){
			self.mover(este)
			//self.moveteAlaDerecha(){}
		}else if (dado == 4){
			self.mover(sur)
			//self.moveteHaciaAbajo(){}
		}









//		var dado = (1..1).map({n => 0.randomUpTo(4).truncate(0)})
//	
//		if (dado == 0 and self.position().y() < game.height()- 1){
//			self.position(self.position().up(1))			
//		}else if (dado == 1 and self.position().y() > 0){
//			self.position(self.position().down(1))
//		}else if (dado == 2 and self.position().x()>0){
//		self.position(self.position().left(1))
//		}else if (dado == 3 and self.position().x()< game.width() - 1 ){
//		self.position(self.position().right(1))
//		}
	}
	
	
	
}