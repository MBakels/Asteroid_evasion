package  {
	
	import flash.display.MovieClip;
	
	public class Mover extends MovieClip {
		
		// Properties
		var vecLocation:Vector2;
		var vecDestination:Vector2;
		var vecDirection:Vector2;
		var vecVelocity:Vector2;
		var vecAcceleration:Vector2;
		var maxSpeed:int;
		var mass:Number;
		var angle:Number;
		var aVelocity:Number;
		var aAcceleration:Number;
		
		// constructor code
		public function Mover() {
			
		}
		
		public function Move(){
			this.x = vecLocation.x;
			this.y = vecLocation.y;
		}
		
		public function applyForce(force:Vector2){
			var f:Vector2 = Vector2.divS(force, mass);
			vecAcceleration.add(f);
		}

	}
	
}
