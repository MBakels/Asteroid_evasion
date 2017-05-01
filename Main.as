package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	
	public class Main extends MovieClip {
		
		// Properties
		var onMenuOrgamePaused:Boolean;
		var onMenu:Boolean;
		var pauseMenu:PauseMenu;
		var mainMenu:MainMenu;
		var deathScreen:DeathScreen;
		var gameTimer:Timer;
		var spawnAsteroidTimer:Timer;
		var cannonCoolingTimer:Timer;
		public static var asteroids:Array = new Array();
		public static var bullets:Array = new Array();
		var particleSystems:Array = new Array();
		public var player:PlayerShip;
		var cannonOnCooldown:Boolean;
		var score:int;
		var minute:int;
		var second:int;
		var gui:MovieClip;
		var scoreText:TextField;
		var timeText:TextField;
		var textFormat:TextFormat;
		
		// constructor code
		public function Main() {
			onMenuOrgamePaused = true;
			onMenu = true;
			
			textFormat = new TextFormat();
			textFormat.size = 28;
			textFormat.align = TextFormatAlign.CENTER;
			textFormat.color = 0xFFFFFF;
			
			DrawGui();
			
			mainMenu = new MainMenu(this);
			pauseMenu = new PauseMenu(this);
			deathScreen = new DeathScreen(this);
			player = new PlayerShip(this);
			
			stage.addChild(mainMenu);
			
			gameTimer = new Timer(1000);
			gameTimer.addEventListener(TimerEvent.TIMER, GameTimer);
			spawnAsteroidTimer = new Timer(500);
			spawnAsteroidTimer.addEventListener(TimerEvent.TIMER, SpawnAsteroid);
			cannonCoolingTimer = new Timer(3000);
			cannonCoolingTimer.addEventListener(TimerEvent.TIMER, CannonCooldownTimer);
			
			addEventListener(Event.ENTER_FRAME, Update);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, MouseDown);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, KeyUp);
		}
		
		function Update(e:Event):void{
			if(!onMenuOrgamePaused){
				if(stage.contains(player)){
					player.Update();
				}
				for(var p = particleSystems.length - 1; p >= 0; p--){
					var ps = particleSystems[p];
					ps.Update();
					if(ps.IsDead()){
						stage.removeChild(particleSystems[p]);
						particleSystems.removeAt(p);
					}
				}
				for(var a = asteroids.length - 1; a >= 0; a--){
					var asteroid = asteroids[a];
					asteroid.Update();
					if(asteroid.OnScreenCheck(150)){
						asteroids.splice(asteroids.indexOf(asteroid), 1);
						stage.removeChild(asteroid);
					}
				}
				for(var b = bullets.length - 1; b >= 0; b--){
					var bullet = bullets[b];
					bullet.Update();
					if(bullet.OnScreenCheck(20)){
						bullets.splice(bullets.indexOf(bullet), 1);
						stage.removeChild(bullet);
					}
				}
				
				for(var c = asteroids.length - 1; c >= 0; c--){
					var ast = asteroids[c];
					for each(var f:Asteroid in asteroids){
						if(ast != f){
							if(ast.CheckCircleCollision(f)){
								ast.SetNewVelocities(f);
							}
						}
					}
					for(var d = bullets.length - 1; d >= 0; d--){
						var bul = bullets[d];
						if(ast.CheckCircleCollision(bul)){
							asteroids.splice(asteroids.indexOf(ast), 1);
							stage.removeChild(ast);
							bullets.splice(bullets.indexOf(bul), 1);
							stage.removeChild(bul);
							BreakAsteroid(ast);
							score += 10;
							UpdateGui();
						}
					}
					if(stage.contains(player) && ast.CheckCircleCollision(player)){
						stage.removeChild(player);
						stage.removeChild(gui);
						gameTimer.stop();
						deathScreen.UpdateText();
						stage.addChild(deathScreen);
					}
				}
			}
		}
		
		function BreakAsteroid(c){
			var ps = new ParticleSystem(c);
			particleSystems.push(ps);
			ps.addParticle(Smoke, 3 * c.radius);
			stage.addChild(particleSystems[particleSystems.length - 1]);
			
			var startAngle = Math.random() * 360;
			var angle = startAngle;
			for(var a = 0; a < 3; a++){
				var asteroid = new Asteroid(this);
				
				if(a == 1){
					angle = startAngle - 120;
				}else if(a == 2){
					angle = startAngle + 120;
				}
				
				asteroid.ReCalculatePropertiesForSmallerAsteroids(c, Vector2.deg2rad(angle));
				asteroids.push(asteroid);
				stage.addChildAt(asteroids[asteroids.length - 1], 1);
			}
		}
		
		function DrawGui(){
			gui = new MovieClip();
			
			scoreText = new TextField();
			scoreText.text = "Score: 0";
			scoreText.setTextFormat(textFormat);
			scoreText.width = 150;
			scoreText.height = 50;
			scoreText.x = stage.stageWidth - scoreText.width;
			scoreText.y = 5;
			scoreText.selectable = false;
			scoreText.mouseEnabled = false;
			gui.addChild(scoreText);
			
			timeText = new TextField();
			timeText.text = "Time: " + minute + ":" + second;
			timeText.setTextFormat(textFormat);
			timeText.width = 150;
			timeText.height = 50;
			timeText.y = 5;
			timeText.selectable = false;
			timeText.mouseEnabled = false;
			gui.addChild(timeText);
		}
		
		function UpdateGui(){
			if(minute < 10){
				if(second < 10){
					timeText.text = "Time: 0" + minute + ":0" + second;
				}else{
					timeText.text = "Time: 0" + minute + ":" + second;
				}
			}else{
				if(second < 10){
					timeText.text = "Time: " + minute + ":0" + second;
				}else{
					timeText.text = "Time: " + minute + ":" + second;
				}
			}
			timeText.setTextFormat(textFormat);
			scoreText.text = "Score: " + score;
			scoreText.setTextFormat(textFormat);
		}
		
		function GameTimer(event:TimerEvent):void {
			score++;
			second++;
			if(second == 60){
				second = 0;
				minute++;
			}
			UpdateGui();
		}
		
		public function StartOrRestart(){
			onMenuOrgamePaused = false;
			onMenu = false;
			score = 0;
			second = 0;
			minute = 0;
			cannonOnCooldown = false;
			spawnAsteroidTimer.start();
			gameTimer.reset();
			gameTimer.start();
			UpdateGui();
			RemoveAllGameObjects();
			player.RestartPlayer();
			stage.addChild(player);
			stage.addChild(gui);
		}
		                       
		public function ToMenu(){
			onMenuOrgamePaused = true;
			onMenu = true;
			spawnAsteroidTimer.stop();
			RemoveAllGameObjects();
			stage.addChild(mainMenu);
		}
		
		function RemoveAllGameObjects(){
			if(stage.contains(player)){
				stage.removeChild(player);
			}
			for(var a = asteroids.length - 1; a >= 0; a--){
				stage.removeChild(asteroids[a]);
				asteroids.removeAt(a);
			}
			for(var b = bullets.length - 1; b >= 0; b--){
				stage.removeChild(bullets[b]);
				bullets.removeAt(b);
			}
			for(var p = particleSystems.length - 1; p >= 0; p--){
				stage.removeChild(particleSystems[p]);
				particleSystems.removeAt(p);
			}
			if(stage.contains(pauseMenu)){
				stage.removeChild(pauseMenu);
			}
			if(stage.contains(deathScreen)){
				stage.removeChild(deathScreen);
			}
			if(stage.contains(gui)){
				stage.removeChild(gui);
			}
		}
		
		function SpawnAsteroid(e:TimerEvent):void{
			asteroids.push(new Asteroid(this));
			stage.addChildAt(asteroids[asteroids.length - 1], 1);
		}
		
		function CannonCooldownTimer(e:TimerEvent):void{
			cannonOnCooldown = false;
		}
		
		function MouseDown(e:MouseEvent){
			if(stage.contains(player) && !cannonOnCooldown && !onMenuOrgamePaused){
				cannonOnCooldown = true;
				bullets.push(new Bullet(player));
				stage.addChild(bullets[bullets.length - 1]);
				cannonCoolingTimer.start();
				player.CannonRecoil();
			}
		}
		
		function KeyDown(e:KeyboardEvent):void{
			if(e.keyCode == Keyboard.SPACE){
				player.rocketThrust = true;
			}
			if(e.keyCode == Keyboard.ESCAPE){
				PauseGame();
			}
			if(e.keyCode == Keyboard.T){
				
			}
		}
		
		function KeyUp(e:KeyboardEvent):void{
			if(e.keyCode == Keyboard.SPACE){
				player.rocketThrust = false;
			}
		}
		
		public function PauseGame(){
			if(!onMenu){
				if(!onMenuOrgamePaused){
						onMenuOrgamePaused = true;
						player.stop();
						gameTimer.stop();
						spawnAsteroidTimer.stop();
						stage.addChild(pauseMenu);
					}else{
						onMenuOrgamePaused = false;
						player.play();
						gameTimer.start();
						spawnAsteroidTimer.start();
						stage.removeChild(pauseMenu);
					}
			}
		}
		
	}
	
}
