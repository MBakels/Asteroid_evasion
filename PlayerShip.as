package  {
	
	public class PlayerShip extends Collider {
		
		// Properties
		var main:Main;
		var vecMousePosition:Vector2;
		public var rocketThrust:Boolean;
		var cannon:ShipCannon;
		
		// constructor code
		public function PlayerShip(_main) {
			this.main = _main;
			radius = this.width / 2;
			vecVelocity = new Vector2(0, 0);
			vecAcceleration = new Vector2(0, 0);
			vecLocation = new Vector2((main.stage.stageWidth / 2), (main.stage.stageHeight / 2));
			maxSpeed = 20;
			cannon = new ShipCannon();
			this.addChild(cannon);
		}
		
		public function Update(){
			vecMousePosition = new Vector2(stage.mouseX, stage.mouseY);
			vecDirection = Vector2.sub(vecMousePosition, vecLocation);
			vecDirection.setMag(0.3);
			vecAcceleration = vecDirection;
			if(rocketThrust){
				vecVelocity.add(vecAcceleration);
			}
			vecVelocity.limit(maxSpeed);
			vecLocation.add(vecVelocity);
			
			var rad = vecDirection.getAngle();
			angle = Vector2.rad2deg(rad);
			cannon.rotation = angle;
			Move();
		}
		
		public function RestartPlayer(){
			vecLocation = new Vector2((main.stage.stageWidth / 2), (main.stage.stageHeight / 2));
			vecVelocity = new Vector2(0, 0);
			play();
		}
		
		public function CannonRecoil(){
			var recoil:Vector2 = vecDirection.copy();
			recoil.setMag(2);
			recoil.multS(-1);
			vecVelocity.add(recoil);
		}

	}
	
}
