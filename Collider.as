package  {
	
	import flash.display.MovieClip;
	
	public class Collider extends Mover {
		
		// Properties
		var radius;
		
		// constructor code
		public function Collider() {
			
		}
		
		//Circle collisions
		function CheckCircleCollision(other:Object):Boolean{
			//axis-aligned bounding box check
			if (this.x + this.radius + other.radius > other.x 
			&& this.x < other.x + this.radius + other.radius
			&& this.y + this.radius + other.radius > other.y 
			&& this.y < other.y + this.radius + other.radius){
				//AABBs are overlapping
				if (DistanceTo(other) < this.radius + other.radius){
					//balls have collided
					return true;
				}
			}
			return false;
		}
		
		public function DistanceTo(other:Object):Number{
			var distance:Number = Math.sqrt(((this.x - other.x) * (this.x - other.x)) + ((this.y - other.y) * (this.y - other.y)));
			if (distance < 0) distance *= -1;
			return distance;
		}
		
		public function CollisionPoint(other:Object){
			var x1:Number = this.x;
			var y1:Number = this.y;
			var r1:Number = this.radius;
			var x2:Number = other.x;
			var y2:Number = other.y;
			var r2:Number = other.radius;
			
			var collisionPoint:Vector2 = new Vector2((x1 * r2 + x2 * r1) / (r1 + r2), (y1 * r2 + y2 * r1) / (r1 + r2));
			return collisionPoint;
		}
		
		public function SetNewVelocities(other:Object){
			var xVel1:Number = this.vecVelocity.x;
			var yVel1:Number = this.vecVelocity.y;
			var mass1:Number = this.radius;
			var xVel2:Number = other.vecVelocity.x;
			var yVel2:Number = other.vecVelocity.y;
			var mass2:Number = other.radius;
			
			var newXVel1:Number = (xVel1 * (mass1 - mass2) + (2 * mass2 * xVel2)) / (mass1 + mass2);
			var newYVel1:Number = (yVel1 * (mass1 - mass2) + (2 * mass2 * yVel2)) / (mass1 + mass2);
			var newXVel2:Number = (xVel2 * (mass2 - mass1) + (2 * mass1 * xVel1)) / (mass1 + mass2);
			var newYVel2:Number = (yVel2 * (mass2 - mass1) + (2 * mass1 * yVel1)) / (mass1 + mass2);
			
			this.vecVelocity.x = newXVel1;
			this.vecVelocity.y = newYVel1;
			other.vecVelocity.x = newXVel2;
			other.vecVelocity.y = newYVel2;
			
			this.x += newXVel1;
			this.y += newYVel1;
			other.x += newXVel2;
			other.y += newYVel2;
		}
		
		public function OnScreenCheck(margin:Number = 0):Boolean{
			if(vecLocation.x < -margin || vecLocation.x > stage.stageWidth + margin || vecLocation.y < -margin || vecLocation.y > stage.stageHeight + margin){
				return true;
			}else{
				return false;
			}
		}

	}
	
}
