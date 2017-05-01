package  {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.events.MouseEvent;
	
	public class DeathScreen extends MovieClip {
		
		// Properties
		var main:Main;
		var deathScreenBackground:MovieClip;
		var deathScreenRestartButton:MovieClip;
		var deathScreenBackToMenuButton:MovieClip;
		var deathText:TextField;
		var deathScreenRestartButtonText:TextField;
		var deathScreenBackToMenuButtonText:TextField;
		
		// constructor code
		public function DeathScreen(_main) {
			this.main = _main;
			deathScreenBackground = new MovieClip();
			deathScreenBackground.graphics.beginFill(0x000000);
			deathScreenBackground.graphics.drawRect(0, 0, 300, 240);
			deathScreenBackground.graphics.endFill();
			deathScreenBackground.alpha = .7;
			deathScreenBackground.x = main.stage.stageWidth / 2 - deathScreenBackground.width / 2;
			deathScreenBackground.y = main.stage.stageHeight / 2 - deathScreenBackground.height / 2;
			this.addChild(deathScreenBackground);
			
			deathText = new TextField();
			//deathText.text = "Game over!";
			//deathText.setTextFormat(main.textFormat);
			deathText.width = 300;
			deathText.height = 100;
			deathText.x = deathScreenBackground.width / 2 - deathText.width / 2;
			deathText.y = 5;
			deathText.selectable = false;
			deathText.mouseEnabled = false;
			deathScreenBackground.addChild(deathText);
			
			deathScreenRestartButton = new MovieClip();
			deathScreenRestartButton.graphics.beginFill(0x000000);
			deathScreenRestartButton.graphics.drawRect(0, 0, 250, 50);
			deathScreenRestartButton.graphics.endFill();
			deathScreenRestartButton.x = deathScreenBackground.width / 2 - deathScreenRestartButton.width / 2;
			deathScreenRestartButton.y = 90;
			deathScreenRestartButton.addEventListener(MouseEvent.CLICK, RestartButton);
			deathScreenBackground.addChild(deathScreenRestartButton);
			
			deathScreenRestartButtonText = new TextField();
			deathScreenRestartButtonText.text = "Restart";
			deathScreenRestartButtonText.setTextFormat(main.textFormat);
			deathScreenRestartButtonText.width = 250;
			deathScreenRestartButtonText.height = 50;
			deathScreenRestartButtonText.y = 5;
			deathScreenRestartButtonText.selectable = false;
			deathScreenRestartButtonText.mouseEnabled = false;
			deathScreenRestartButton.addChild(deathScreenRestartButtonText);
			
			deathScreenBackToMenuButton = new MovieClip();
			deathScreenBackToMenuButton.graphics.beginFill(0x000000);
			deathScreenBackToMenuButton.graphics.drawRect(0, 0, 250, 50);
			deathScreenBackToMenuButton.graphics.endFill();
			deathScreenBackToMenuButton.x = deathScreenBackground.width / 2 - deathScreenBackToMenuButton.width / 2;
			deathScreenBackToMenuButton.y = 165;
			deathScreenBackToMenuButton.addEventListener(MouseEvent.CLICK, MenuButton);
			deathScreenBackground.addChild(deathScreenBackToMenuButton);
			
			deathScreenBackToMenuButtonText = new TextField();
			deathScreenBackToMenuButtonText.text = "Menu";
			deathScreenBackToMenuButtonText.setTextFormat(main.textFormat);
			deathScreenBackToMenuButtonText.width = 250;
			deathScreenBackToMenuButtonText.height = 50;
			deathScreenBackToMenuButtonText.y = 5;
			deathScreenBackToMenuButtonText.selectable = false;
			deathScreenBackToMenuButtonText.mouseEnabled = false;
			deathScreenBackToMenuButton.addChild(deathScreenBackToMenuButtonText);
		}
		
		public function UpdateText(){
			deathText.text = "Game over! \n" + main.timeText.text + "    " + main.scoreText.text;
			deathText.setTextFormat(main.textFormat);
		}
		
		function RestartButton(e:MouseEvent){
			main.StartOrRestart();
		}
		
		function MenuButton(e:MouseEvent){
			main.ToMenu();
		}

	}
	
}
