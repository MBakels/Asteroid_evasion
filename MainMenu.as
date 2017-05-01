package  {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.events.MouseEvent;
	
	public class MainMenu extends MovieClip {
		
		// Properties
		var main:Main;
		//Mainmenu
		var mainMenuBackground:MovieClip;
		var mainMenuStartButton:MovieClip;
		var mainMenuCreditsButton:MovieClip;
		var mainMenuExitButton:MovieClip;
		var gameTitle:TextField;
		var mainMenuStartButtonText:TextField;
		var mainMenuCreditsButtonText:TextField;
		var mainMenuExitButtonText:TextField;
		//ControlsWindow
		var controlsMenuBackground:MovieClip;
		var controlsBackButton:MovieClip;
		var controlsBackButtonText:TextField;
		var controlsWindowName:TextField;
		var controlsText:TextField;
		//CreditsWindow
		var creditsMenuBackground:MovieClip;
		var creditsBackButton:MovieClip;
		var creditsBackButtonText:TextField;
		var creditsWindowName:TextField;
		var creditsText:TextField;
		
		// constructor code
		public function MainMenu(_main) {
			this.main = _main;
			
			//Mainmenu
			mainMenuBackground = new MovieClip();
			mainMenuBackground.graphics.beginFill(0x000000);
			mainMenuBackground.graphics.drawRect(0, 0, 300, 275);
			mainMenuBackground.graphics.endFill();
			mainMenuBackground.alpha = .7;
			mainMenuBackground.x = main.stage.stageWidth / 2 - mainMenuBackground.width / 2;
			mainMenuBackground.y = main.stage.stageHeight / 2 - mainMenuBackground.height / 2;
			this.addChild(mainMenuBackground);
			
			gameTitle = new TextField();
			gameTitle.text = "Asteroid evasion";
			gameTitle.setTextFormat(main.textFormat);
			gameTitle.width = 250;
			gameTitle.height = 50;
			gameTitle.x = mainMenuBackground.width / 2 - gameTitle.width / 2;
			gameTitle.y = 5;
			gameTitle.selectable = false;
			gameTitle.mouseEnabled = false;
			mainMenuBackground.addChild(gameTitle);
			
			mainMenuStartButton = new MovieClip();
			mainMenuStartButton.graphics.beginFill(0x000000);
			mainMenuStartButton.graphics.drawRect(0, 0, 250, 50);
			mainMenuStartButton.graphics.endFill();
			mainMenuStartButton.x = mainMenuBackground.width / 2 - mainMenuStartButton.width / 2;
			mainMenuStartButton.y = 50;
			mainMenuStartButton.addEventListener(MouseEvent.CLICK, StartButton);
			mainMenuBackground.addChild(mainMenuStartButton);
			
			mainMenuStartButtonText = new TextField();
			mainMenuStartButtonText.text = "Start";
			mainMenuStartButtonText.setTextFormat(main.textFormat);
			mainMenuStartButtonText.width = 250;
			mainMenuStartButtonText.height = 50;
			mainMenuStartButtonText.y = 5;
			mainMenuStartButtonText.selectable = false;
			mainMenuStartButtonText.mouseEnabled = false;
			mainMenuStartButton.addChild(mainMenuStartButtonText);
			
			mainMenuCreditsButton = new MovieClip();
			mainMenuCreditsButton.graphics.beginFill(0x000000);
			mainMenuCreditsButton.graphics.drawRect(0, 0, 250, 50);
			mainMenuCreditsButton.graphics.endFill();
			mainMenuCreditsButton.x = mainMenuBackground.width / 2 - mainMenuCreditsButton.width / 2;
			mainMenuCreditsButton.y = 125;
			mainMenuCreditsButton.addEventListener(MouseEvent.CLICK, ControlsButton);
			mainMenuBackground.addChild(mainMenuCreditsButton);
			
			mainMenuCreditsButtonText = new TextField();
			mainMenuCreditsButtonText.text = "Controls";
			mainMenuCreditsButtonText.setTextFormat(main.textFormat);
			mainMenuCreditsButtonText.width = 250;
			mainMenuCreditsButtonText.height = 50;
			mainMenuCreditsButtonText.y = 5;
			mainMenuCreditsButtonText.selectable = false;
			mainMenuCreditsButtonText.mouseEnabled = false;
			mainMenuCreditsButton.addChild(mainMenuCreditsButtonText);
			
			mainMenuExitButton = new MovieClip();
			mainMenuExitButton.graphics.beginFill(0x000000);
			mainMenuExitButton.graphics.drawRect(0, 0, 250, 50);
			mainMenuExitButton.graphics.endFill();
			mainMenuExitButton.x = mainMenuBackground.width / 2 - mainMenuExitButton.width / 2;
			mainMenuExitButton.y = 200;
			mainMenuExitButton.addEventListener(MouseEvent.CLICK, CreditsButton);
			mainMenuBackground.addChild(mainMenuExitButton);
			
			mainMenuExitButtonText = new TextField();
			mainMenuExitButtonText.text = "Credits";
			mainMenuExitButtonText.setTextFormat(main.textFormat);
			mainMenuExitButtonText.width = 250;
			mainMenuExitButtonText.height = 50;
			mainMenuExitButtonText.y = 5;
			mainMenuExitButtonText.selectable = false;
			mainMenuExitButtonText.mouseEnabled = false;
			mainMenuExitButton.addChild(mainMenuExitButtonText);
			
			//ControlsWindow
			controlsMenuBackground = new MovieClip();
			controlsMenuBackground.graphics.beginFill(0x000000);
			controlsMenuBackground.graphics.drawRect(0, 0, 300, 180);
			controlsMenuBackground.graphics.endFill();
			controlsMenuBackground.alpha = .7;
			controlsMenuBackground.x = main.stage.stageWidth / 2 - controlsMenuBackground.width / 2;
			controlsMenuBackground.y = main.stage.stageHeight / 2 - controlsMenuBackground.height / 2;
			
			controlsWindowName = new TextField();
			controlsWindowName.text = "Game controls";
			controlsWindowName.setTextFormat(main.textFormat);
			controlsWindowName.width = 250;
			controlsWindowName.height = 50;
			controlsWindowName.x = controlsMenuBackground.width / 2 - controlsWindowName.width / 2;
			controlsWindowName.y = 5;
			controlsWindowName.selectable = false;
			controlsWindowName.mouseEnabled = false;
			controlsMenuBackground.addChild(controlsWindowName);
			
			controlsText = new TextField();
			controlsText.text = "Space = thrust \n Mouse = direction \n Left click = shoot";
			controlsText.setTextFormat(main.textFormat);
			controlsText.width = 250;
			controlsText.height = 200;
			controlsText.x = controlsMenuBackground.width / 2 - controlsText.width / 2;
			controlsText.y = 55;
			controlsText.selectable = false;
			controlsText.mouseEnabled = false;
			controlsMenuBackground.addChild(controlsText);
			
			controlsBackButton = new MovieClip();
			controlsBackButton.graphics.beginFill(0x000000);
			controlsBackButton.graphics.drawRect(0, 0, 50, 50);
			controlsBackButton.graphics.endFill();
			controlsBackButton.x = 10;
			controlsBackButton.y = 10;
			controlsBackButton.addEventListener(MouseEvent.CLICK, BackButton);
			controlsMenuBackground.addChild(controlsBackButton);
			
			controlsBackButtonText = new TextField();
			controlsBackButtonText.text = "\u25c4";
			controlsBackButtonText.setTextFormat(main.textFormat);
			controlsBackButtonText.width = 50;
			controlsBackButtonText.height = 50;
			controlsBackButtonText.y = 6;
			controlsBackButtonText.selectable = false;
			controlsBackButtonText.mouseEnabled = false;
			controlsBackButton.addChild(controlsBackButtonText);
			
			//CreditsWindow
			creditsMenuBackground = new MovieClip();
			creditsMenuBackground.graphics.beginFill(0x000000);
			creditsMenuBackground.graphics.drawRect(0, 0, 300, 250);
			creditsMenuBackground.graphics.endFill();
			creditsMenuBackground.alpha = .7;
			creditsMenuBackground.x = main.stage.stageWidth / 2 - creditsMenuBackground.width / 2;
			creditsMenuBackground.y = main.stage.stageHeight / 2 - creditsMenuBackground.height / 2;
			
			creditsWindowName = new TextField();
			creditsWindowName.text = "Credits";
			creditsWindowName.setTextFormat(main.textFormat);
			creditsWindowName.width = 250;
			creditsWindowName.height = 50;
			creditsWindowName.x = creditsMenuBackground.width / 2 - creditsWindowName.width / 2;
			creditsWindowName.y = 5;
			creditsWindowName.selectable = false;
			creditsWindowName.mouseEnabled = false;
			creditsMenuBackground.addChild(creditsWindowName);
			
			creditsText = new TextField();
			creditsText.text = "Developers: \n Marco Bakels \n \n Artists: \n Marco Bakels";
			creditsText.setTextFormat(main.textFormat);
			creditsText.width = 250;
			creditsText.height = 200;
			creditsText.x = creditsMenuBackground.width / 2 - creditsText.width / 2;
			creditsText.y = 55;
			creditsText.selectable = false;
			creditsText.mouseEnabled = false;
			creditsMenuBackground.addChild(creditsText);
			
			creditsBackButton = new MovieClip();
			creditsBackButton.graphics.beginFill(0x000000);
			creditsBackButton.graphics.drawRect(0, 0, 50, 50);
			creditsBackButton.graphics.endFill();
			creditsBackButton.x = 10;
			creditsBackButton.y = 10;
			creditsBackButton.addEventListener(MouseEvent.CLICK, BackButton);
			creditsMenuBackground.addChild(creditsBackButton);
			
			creditsBackButtonText = new TextField();
			creditsBackButtonText.text = "\u25c4";
			creditsBackButtonText.setTextFormat(main.textFormat);
			creditsBackButtonText.width = 50;
			creditsBackButtonText.height = 50;
			creditsBackButtonText.y = 6;
			creditsBackButtonText.selectable = false;
			creditsBackButtonText.mouseEnabled = false;
			creditsBackButton.addChild(creditsBackButtonText);
		}
		
		function StartButton(e:MouseEvent){
			main.StartOrRestart();
			main.stage.removeChild(main.mainMenu);
		}
		
		function ControlsButton(e:MouseEvent){
			this.addChild(controlsMenuBackground);
			this.removeChild(mainMenuBackground);
		}
		
		function CreditsButton(e:MouseEvent){
			this.addChild(creditsMenuBackground);
			this.removeChild(mainMenuBackground);
		}
		
		function BackButton(e:MouseEvent){
			this.addChild(mainMenuBackground);
			if(this.contains(controlsMenuBackground)){
				this.removeChild(controlsMenuBackground);
			}
			if(this.contains(creditsMenuBackground)){
				this.removeChild(creditsMenuBackground);
			}
		}

	}
	
}
