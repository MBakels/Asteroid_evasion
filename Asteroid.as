package  {
	
	import flash.display.MovieClip;
	
	public class Asteroid extends Collider {
		
		// Properties
		var main:Main;
		
		// constructor code
		public function Asteroid(_main) {
			this.main = _main;
			mass = Math.random() * 0.5 + 0.5;
			this.width *= mass;
			this.height *= mass;
			radius = this.width / 2;
			angle = 0;
			this.x = -100;
			this.y = -100;
			RandomRotation();
			
			RandomAsteroidSpawnAndDirection();
			vecVelocity = new Vector2(0, 0);
			var vecDirection = Vector2.sub(vecDestination, vecLocation);
			vecDirection.setMag(5 / mass);
			vecVelocity = vecDirection;
		}
		
		public function Update(){
			angle += aVelocity;
			this.rotation = angle;
			vecLocation.add(vecVelocity);
			Move();
		}
		
		function RandomRotation(){
			aVelocity = 0.50 + (1.5 - 0.50) * Math.random();
			if(Math.random() > 0.5){
				aVelocity *= -1;
			}
		}
		
		function RandomAsteroidSpawnAndDirection(){
			var randomSpawn:int = Math.floor(Math.random() * 4);
			switch(randomSpawn){
				case 0:
					vecLocation = new Vector2(Math.random() * 980, -100);
					break;
				case 1:
					vecLocation = new Vector2(Math.random() * 980, 980 + 100);
					break;
				case 2:
					vecLocation = new Vector2(-100, Math.random() * 980);
					break;
				case 3:
					vecLocation = new Vector2(980 + 100, Math.random() * 980);
					break;
			}
			while(randomEnd == randomSpawn){
				var randomEnd:int = Math.floor(Math.random() * 4);
			}
			switch(randomEnd){
				case 0:
					vecDestination = new Vector2(Math.random() * 980, -100);
					break;
				case 1:
					vecDestination = new Vector2(Math.random() * 980, 980 + 100);
					break;
				case 2:
					vecDestination = new Vector2(-100, Math.random() * 980);
					break;
				case 3:
					vecDestination = new Vector2(980 + 100, Math.random() * 980);
					break;
			}
		}
		
		public function ReCalculatePropertiesForSmallerAsteroids(origin:Object, angle:Number){
			mass = (origin.mass / 2) * (0.8 + Math.random() * (1.2 - 0.8));
			this.width *= mass;
			this.height *= mass;
			radius = this.width / 2;
			
			vecLocation = origin.vecLocation.copy();
			var vecOffset:Vector2 = new Vector2(0, 0);
			vecOffset.fromAngle(angle);
			vecOffset.setMag(25);
			vecLocation.add(vecOffset);
			
			vecVelocity = origin.vecVelocity.copy();
			vecVelocity.divS(2);
			var vecVelocityOffset:Vector2 = new Vector2(0 ,0);
			vecVelocityOffset.fromAngle(angle);
			vecVelocityOffset.setMag(0.5 / mass);
			vecVelocity.add(vecVelocityOffset);
		}

	}
	
}
