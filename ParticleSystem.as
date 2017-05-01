package  {
	
	import flash.display.MovieClip;
	
	public class ParticleSystem extends MovieClip {
		
		// Properties
		var origin:Object;
		var particles:Array;
		var lifespan:Number;
		
		// constructor code
		public function ParticleSystem(_origin:Object) {
			this.origin = _origin;
			particles = new Array();
			lifespan = 200;
		}
		
		public function addParticle(parType:Class, amount:int = 1){
			for(var a:int = 0; a < amount; a++){
				particles.push(new parType(origin));
				this.addChild(particles[particles.length - 1]);
			}
		}
		
		public function Update(){
			lifespan -= 1.0;
			for(var i = particles.length - 1; i >= 0; i--){
				var p = particles[i];
				p.Update();
				if (p.IsDead()) {
					particles.removeAt(i);
					this.removeChild(p);
				}
			}
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
