package  {
	
	import flash.display.MovieClip;
	
	public class Particle extends Mover {
		
		// Properties
		var lifespan:Number;
		
		// constructor code
		public function Particle(origin:Object) {
			vecLocation = origin.vecLocation.copy();
			vecVelocity = new Vector2(0, 0);
			vecAcceleration = new Vector2(0, 0);
			lifespan = 200;
		}
		
		public function Update(){
			vecVelocity.add(vecAcceleration);
			vecLocation.add(vecVelocity);
			DecreaseLifespan();
			Move();
		}
		
		function DecreaseLifespan(){
			lifespan -= 1.0;
		}
		
		public function IsDead(){
			if(lifespan < 0){
				return true;
			}else{
				return false;
			}
		}

	}
	
}
