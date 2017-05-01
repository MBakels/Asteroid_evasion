package  {
	
	import flash.display.MovieClip;
	
	
	public class Bullet extends Collider {
		
		var player:PlayerShip;
		
		// constructor code
		public function Bullet(_player) {
			this.player = _player;
			radius = this.width / 2;
			vecLocation = player.vecLocation.copy();
			vecVelocity = player.vecVelocity.copy();
			vecDirection = player.vecDirection.copy();
			vecDirection.setMag(15);
			vecVelocity.add(vecDirection);
			
			var rad = vecDirection.getAngle();
			angle = Vector2.rad2deg(rad);
			this.rotation = angle;
		}
		
		public function Update(){
			vecLocation.add(vecVelocity);
			Move();
		}
		
	}
	
}
