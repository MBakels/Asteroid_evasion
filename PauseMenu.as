package  {
	
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.events.MouseEvent;
	
	public class PauseMenu extends MovieClip {
		
		// Properties
		var main:Main;
		var pauseMenuBackground:MovieClip;
		var pauseMenuResumeButton:MovieClip;
		var pauseMenuBackToMenuButton:MovieClip;
		var gamePausedText:TextField;
		var pauseMenuResumeButtonText:TextField;
		var pauseMenuBackToMenuButtonText:TextField;
		var menuTextFormat:TextFormat;
		
		// constructor code
		public function PauseMenu(_main) {
			this.main = _main;
			pauseMenuBackground = new MovieClip();
			pauseMenuBackground.graphics.beginFill(0x000000);
			pauseMenuBackground.graphics.drawRect(0, 0, 300, 200);
			pauseMenuBackground.graphics.endFill();
			pauseMenuBackground.alpha = .7;
			pauseMenuBackground.x = main.stage.stageWidth / 2 - pauseMenuBackground.width / 2;
			pauseMenuBackground.y = main.stage.stageHeight / 2 - pauseMenuBackground.height / 2;
			this.addChild(pauseMenuBackground);
			
			menuTextFormat = new TextFormat();
			menuTextFormat.size = 28;
			menuTextFormat.align = TextFormatAlign.CENTER;
			menuTextFormat.color = 0xFFFFFF;
			gamePausedText = new TextField();
			gamePausedText.text = "Game paused!";
			gamePausedText.setTextFormat(menuTextFormat);
			gamePausedText.width = 250;
			gamePausedText.height = 50;
			gamePausedText.x = pauseMenuBackground.width / 2 - gamePausedText.width / 2;
			gamePausedText.y = 5;
			gamePausedText.selectable = false;
			gamePausedText.mouseEnabled = false;
			pauseMenuBackground.addChild(gamePausedText);
			
			pauseMenuResumeButton = new MovieClip();
			pauseMenuResumeButton.graphics.beginFill(0x000000);
			pauseMenuResumeButton.graphics.drawRect(0, 0, 250, 50);
			pauseMenuResumeButton.graphics.endFill();
			pauseMenuResumeButton.x = pauseMenuBackground.width / 2 - pauseMenuResumeButton.width / 2;
			pauseMenuResumeButton.y = 50;
			pauseMenuResumeButton.addEventListener(MouseEvent.CLICK, ResumeButton);
			pauseMenuBackground.addChild(pauseMenuResumeButton);
			
			pauseMenuResumeButtonText = new TextField();
			pauseMenuResumeButtonText.text = "Resume";
			pauseMenuResumeButtonText.setTextFormat(menuTextFormat);
			pauseMenuResumeButtonText.width = 250;
			pauseMenuResumeButtonText.height = 50;
			pauseMenuResumeButtonText.y = 5;
			pauseMenuResumeButtonText.selectable = false;
			pauseMenuResumeButtonText.mouseEnabled = false;
			pauseMenuResumeButton.addChild(pauseMenuResumeButtonText);
			
			pauseMenuBackToMenuButton = new MovieClip();
			pauseMenuBackToMenuButton.graphics.beginFill(0x000000);
			pauseMenuBackToMenuButton.graphics.drawRect(0, 0, 250, 50);
			pauseMenuBackToMenuButton.graphics.endFill();
			pauseMenuBackToMenuButton.x = pauseMenuBackground.width / 2 - pauseMenuBackToMenuButton.width / 2;
			pauseMenuBackToMenuButton.y = 125;
			pauseMenuBackToMenuButton.addEventListener(MouseEvent.CLICK, MenuButton);
			pauseMenuBackground.addChild(pauseMenuBackToMenuButton);
			
			pauseMenuBackToMenuButtonText = new TextField();
			pauseMenuBackToMenuButtonText.text = "Menu";
			pauseMenuBackToMenuButtonText.setTextFormat(menuTextFormat);
			pauseMenuBackToMenuButtonText.width = 250;
			pauseMenuBackToMenuButtonText.height = 50;
			pauseMenuBackToMenuButtonText.y = 5;
			pauseMenuBackToMenuButtonText.selectable = false;
			pauseMenuBackToMenuButtonText.mouseEnabled = false;
			pauseMenuBackToMenuButton.addChild(pauseMenuBackToMenuButtonText);
		}
		
		function ResumeButton(e:MouseEvent){
			main.PauseGame();
		}
		
		function MenuButton(e:MouseEvent){
			main.ToMenu();
		}

	}
	
}
