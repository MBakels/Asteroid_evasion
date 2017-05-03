package  {
	
	import flash.display.MovieClip;
	
	public class Collider extends MovieClip {
		
		// Properties
		var par:Object;
		var radius;
		
		// constructor code
		public function Collider(_par, _radius = 0) {
			this.par = _par;
			this.radius = _radius;
		}
		
		//Circle collisions
		function CheckCircleCollision(other:Object):Boolean{
			//axis-aligned bounding box check
			if (par.x + this.radius + other.collider.radius > other.x 
			&& par.x < other.x + this.radius + other.collider.radius
			&& par.y + this.radius + other.collider.radius > other.y 
			&& par.y < other.y + this.radius + other.collider.radius){
				//AABBs are overlapping
				if (DistanceTo(other) < this.radius + other.collider.radius){
					//balls have collided
					return true;
				}
			}
			return false;
		}
		
		public function DistanceTo(other:Object):Number{
			var distance:Number = Math.sqrt(((par.x - other.x) * (par.x - other.x)) + ((par.y - other.y) * (par.y - other.y)));
			if (distance < 0) distance *= -1;
			return distance;
		}
		
		public function CollisionPoint(other:Object){
			var x1:Number = par.x;
			var y1:Number = par.y;
			var r1:Number = this.radius;
			var x2:Number = other.x;
			var y2:Number = other.y;
			var r2:Number = other.collider.radius;
			
			var collisionPoint:Vector2 = new Vector2((x1 * r2 + x2 * r1) / (r1 + r2), (y1 * r2 + y2 * r1) / (r1 + r2));
			return collisionPoint;
		}
		
		public function SetNewVelocities(other:Object){
			var xVel1:Number = par.vecVelocity.x;
			var yVel1:Number = par.vecVelocity.y;
			var mass1:Number = this.radius;
			var xVel2:Number = other.vecVelocity.x;
			var yVel2:Number = other.vecVelocity.y;
			var mass2:Number = other.collider.radius;
			
			var newXVel1:Number = (xVel1 * (mass1 - mass2) + (2 * mass2 * xVel2)) / (mass1 + mass2);
			var newYVel1:Number = (yVel1 * (mass1 - mass2) + (2 * mass2 * yVel2)) / (mass1 + mass2);
			var newXVel2:Number = (xVel2 * (mass2 - mass1) + (2 * mass1 * xVel1)) / (mass1 + mass2);
			var newYVel2:Number = (yVel2 * (mass2 - mass1) + (2 * mass1 * yVel1)) / (mass1 + mass2);
			
			par.vecVelocity.x = newXVel1;
			par.vecVelocity.y = newYVel1;
			other.vecVelocity.x = newXVel2;
			other.vecVelocity.y = newYVel2;
			
			par.x += newXVel1;
			par.y += newYVel1;
			other.x += newXVel2;
			other.y += newYVel2;
		}
		
		public function OnScreenCheck(margin:Number = 0):Boolean{
			if(par.vecLocation.x < -margin || par.vecLocation.x > par.stage.stageWidth + margin || par.vecLocation.y < -margin || par.vecLocation.y > par.stage.stageHeight + margin){
				return true;
			}else{
				return false;
			}
		}

	}
	
}
