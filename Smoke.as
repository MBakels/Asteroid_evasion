package  {
	
	public class Smoke extends Particle {
		
		// constructor code
		public function Smoke(origin:Object) {
			super(origin);
			RandomLocation(origin);
			lifespan = 50 + Math.random() * (100 - 50)
			this.width = 15;
			this.height = 15;
			angle = 0;
			RandomRotation();
		}
		
		override public function Update(){
			vecVelocity.setTo((-0.5 + Math.random() * (0.5 - -0.5)), (-0.5 + Math.random() * (0.5 - -0.5)));
			super.Update();
			angle += aVelocity;
			this.rotation = angle;
		}
		
		function RandomRotation(){
			aVelocity = (-1.5 + Math.random() * (1.5 - -1.5))
			if(Math.random() > 0.5){
				aVelocity *= -1;
			}
		}
		
		function RandomLocation(origin:Object){
			var vecAngle:Number = Math.random() * 360;
			var vecRandomLocation:Vector2 = new Vector2(0, 0);
			vecRandomLocation.fromAngle(vecAngle);
			vecRandomLocation.multS(Math.random() * (origin.radius * 1.2));
			vecLocation.add(vecRandomLocation);
		}

	}
	
}
