package  {
	
	import flash.display.MovieClip;
	
	
	public class Bullet extends Mover {
		
		var player:PlayerShip;
		var collider:Collider;
		
		// constructor code
		public function Bullet(_player) {
			this.player = _player;
			collider = new Collider(this, this.width / 2);
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
