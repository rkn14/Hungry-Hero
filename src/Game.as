/**
 *
 * Hungry Hero Game
 * http://www.hungryherogame.com
 * 
 * Copyright (c) 2012 Hemanth Sharma (www.hsharma.com). All rights reserved.
 * 
 * This ActionScript source code is free.
 * You can redistribute and/or modify it in accordance with the
 * terms of the accompanying Simplified BSD License Agreement.
 *  
 */

package
{
	import com.hsharma.hungryHero.events.NavigationEvent;
	import com.hsharma.hungryHero.screens.InGame;
	import com.hsharma.hungryHero.screens.Welcome;
	import com.hsharma.hungryHero.ui.SoundButton;
	
	import flash.media.SoundMixer;
	import flash.utils.ByteArray;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	import taptabcontroller.controller.vo.AbstractVO;
	import taptabcontroller.net.controller.TapTabController;
	import taptabcontroller.net.controller.TapTabControllerAsset;
	import taptabcontroller.net.controller.TapTabControllerConfigurationVO;
	import taptabcontroller.net.controller.TapTabControllerEvent;
	import taptabcontroller.net.controller.TapTabControllersManager;
	import taptabcontroller.net.controller.TapTabControllersManagerEvent;
	
	/**
	 * This class is the primary Starling Sprite based class
	 * that triggers the different screens. 
	 * 
	 * @author hsharma
	 * 
	 */
	public class Game extends Sprite
	{
		

		// APP ICON
		[Embed(source="icons/icon_512.png", mimeType="application/octet-stream")]
		public static const BMP_APP_ICON : Class;
		
		
		
		/** Screen - Welcome or Main Menu. */
		private var screenWelcome:Welcome;
		
		/** Screen - InGame. */
		private var screenInGame:InGame;
		
		
		/** Sound / Mute button. */
		private var soundButton:SoundButton;
		
		
		private var _taptabControllersManager:TapTabControllersManager;
		private var _tapTabController:TapTabController;
		
		
		private var _currentScreenId:Object;
		
		public function Game()
		{
			super();
			
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		/**
		 * On Game class added to stage. 
		 * @param event
		 * 
		 */
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			// Initialize screens.
			initScreens();
			
			// Initialize TapTab Controller
			initTapTabController();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		  
		
		/**
		 * Initialize TapTab Controller. 
		 * 
		 */
		private function initTapTabController():void
		{
			// conf
			var conf : TapTabControllerConfigurationVO = new TapTabControllerConfigurationVO();
			conf.firstLayoutID = "Welcome";
			conf.layouts = [
				String(TapTabAssets.LAYOUT_WELCOME_XML), 
				String(TapTabAssets.LAYOUT_INGAME_XML), 
				String(TapTabAssets.LAYOUT_LOSE_XML), 
				String(TapTabAssets.LAYOUT_ABOUT_XML), 
				String(TapTabAssets.LAYOUT_INGAME_INTRO_XML
			)];
			conf.assets["bgImage"] = new TapTabControllerAsset(TapTabControllerAsset.TYPE_IMAGE, new TapTabAssets.BMP_BGIMAGE() as ByteArray); 
			conf.assets["sndButton"] = new TapTabControllerAsset(TapTabControllerAsset.TYPE_SOUND, new TapTabAssets.SND_EAT() as ByteArray); 
			conf.assets["sndLose"] = new TapTabControllerAsset(TapTabControllerAsset.TYPE_SOUND, new TapTabAssets.SND_LOSE() as ByteArray); 
			// init _taptabControllersManager
			_taptabControllersManager = new TapTabControllersManager("Hungry Hero", conf, new BMP_APP_ICON() as ByteArray);
			_taptabControllersManager.addEventListener(TapTabControllersManagerEvent.NEW_TAPTABCONTROLLER, _handler_TapTabControllersManager);
			_taptabControllersManager.start();
			
			// score var
			screenInGame.addEventListener("score", _handler_ScoreChange);
		}
		protected function _handler_ScoreChange(event:Event):void
		{
			if(!_tapTabController)
				return;
			
			_tapTabController.setVariable("score", event.data.score);
			
		}		  
		protected function _handler_TapTabControllersManager(event:TapTabControllersManagerEvent):void
		{
			switch (event.type)
			{
				case TapTabControllersManagerEvent.NEW_TAPTABCONTROLLER:
					_initTapTabController(event.taptabController);
					break;
			}
		}
		
		protected function _handler_TapTabController(event:TapTabControllerEvent):void
		{
			switch (event.type)
			{
				case TapTabControllerEvent.CONTROL_CHANGE:
					if (screenWelcome.visible) 
						screenWelcome.onTapTabControllerControlChange(event.value as AbstractVO);
					else if (screenInGame.visible) 
						screenInGame.onTapTabControllerControlChange(event.value as AbstractVO);
					break;
				case TapTabControllerEvent.ACTIVATED:
					
					break;
				case TapTabControllerEvent.DEACTIVATED:
					
					break;
				case TapTabControllerEvent.DISCONNECTED:
					
					break;
				case TapTabControllerEvent.QUIT:
					
					break;
			}
		}
		
		private function _initTapTabController(__tapTabController:TapTabController):void
		{
			if(_tapTabController)
				_killTapTabController(_tapTabController);
			
			_tapTabController = __tapTabController;
			_tapTabController.addEventListener(TapTabControllerEvent.CONTROL_CHANGE, _handler_TapTabController);
			_tapTabController.addEventListener(TapTabControllerEvent.ACTIVATED, _handler_TapTabController);
			_tapTabController.addEventListener(TapTabControllerEvent.DEACTIVATED, _handler_TapTabController);
			_tapTabController.addEventListener(TapTabControllerEvent.DISCONNECTED, _handler_TapTabController);
			_tapTabController.addEventListener(TapTabControllerEvent.QUIT, _handler_TapTabController);
			
			_updateTapTabControllerLayout();
		}
		
		
		
		private function _killTapTabController(__tapTabController:TapTabController):void
		{
			__tapTabController.removeEventListener(TapTabControllerEvent.BOUND, _handler_TapTabController);
			__tapTabController.removeEventListener(TapTabControllerEvent.CONTROL_CHANGE, _handler_TapTabController);
			__tapTabController.addEventListener(TapTabControllerEvent.ACTIVATED, _handler_TapTabController);
			__tapTabController.addEventListener(TapTabControllerEvent.DEACTIVATED, _handler_TapTabController);
			__tapTabController.addEventListener(TapTabControllerEvent.DISCONNECTED, _handler_TapTabController);
			__tapTabController.addEventListener(TapTabControllerEvent.QUIT, _handler_TapTabController);
		}
		
	
		
		
		
		
		
		
		
		
		
		
		
		
		/**
		 * Initialize screens. 
		 * 
		 */
		private function initScreens():void
		{
			this.addEventListener(NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			// InGame screen.
			screenInGame = new InGame();
			screenInGame.addEventListener(NavigationEvent.CHANGE_SCREEN, onInGameNavigation);
			this.addChild(screenInGame);
			
			// Welcome screen.
			screenWelcome = new Welcome();
			this.addChild(screenWelcome);

			// Create and add Sound/Mute button.
			soundButton = new SoundButton();
			soundButton.x = int(soundButton.width * 0.5);
			soundButton.y = int(soundButton.height * 0.5);
			soundButton.addEventListener(Event.TRIGGERED, onSoundButtonClick);
			this.addChild(soundButton)
			
			// Initialize the Welcome screen by default. 
			screenWelcome.initialize();
			
			// Set current screen
			_currentScreenId = "Welcome";
		}
		
		/**
		 * On navigation from different screens. 
		 * @param event
		 * 
		 */
		private function onInGameNavigation(event:NavigationEvent):void
		{
			switch (event.params.id)
			{
				case "mainMenu":
					screenWelcome.initialize();
					if(_tapTabController)
						_tapTabController.loadLayout("Welcome");
					break;
				case "about":
					screenWelcome.initialize();
					screenWelcome.showAbout();
					if(_tapTabController)
						_tapTabController.loadLayout("About");
					break;
			}
		}
		
		/**
		 * On click of the sound/mute button. 
		 * @param event
		 * 
		 */
		private function onSoundButtonClick(event:Event = null):void
		{
			if (Sounds.muted)
			{
				Sounds.muted = false;
				
				if (screenWelcome.visible) Sounds.sndBgMain.play(0, 999);
				else if (screenInGame.visible) Sounds.sndBgGame.play(0, 999);
				
				soundButton.showUnmuteState();
			}
			else
			{
				Sounds.muted = true;
				SoundMixer.stopAll();
				
				soundButton.showMuteState();
			}
		}
		
		/**
		 * On change of screen. 
		 * @param event
		 * 
		 */
		private function onChangeScreen(event:NavigationEvent):void
		{
			_currentScreenId = event.params.id;
			switch (_currentScreenId)
			{
				case "play":
					if(_tapTabController)
						_tapTabController.loadLayout("InGameIntro");
					screenWelcome.disposeTemporarily();
					screenInGame.initialize();
					break;
				case "start":
					if(_tapTabController)
						_tapTabController.loadLayout("InGame");
					break;
				case "lose":
					if(_tapTabController)
						_tapTabController.loadLayout("Lose");
					break;
				case "playAgain":
					if(_tapTabController)
						_tapTabController.loadLayout("InGameIntro");
					break;
				case "about":
					if(_tapTabController)
						_tapTabController.loadLayout("About");
					break;
				case "welcome":
					if(_tapTabController)
						_tapTabController.loadLayout("Welcome");
					break;
			}
			_updateTapTabControllerLayout();
		}
		
		private function _updateTapTabControllerLayout() : void
		{
			if(!_tapTabController)
				return;
			
			switch(_currentScreenId)
			{
				case "play":					
					_tapTabController.loadLayout("InGameIntro");
					break;
				case "start":
					_tapTabController.loadLayout("InGame");
					break;
				case "lose":
					_tapTabController.loadLayout("Lose");
					break;
				case "playAgain":
					_tapTabController.loadLayout("InGameIntro");
					break;
				case "about":
					_tapTabController.loadLayout("About");
					break;
				case "welcome":
					_tapTabController.loadLayout("Welcome");
					break;
			}
				
		}
		
	}
}