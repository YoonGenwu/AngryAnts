package edu.arizona.gui {
	import edu.arizona.TouchOverlay;
	import edu.arizona.YouTubePlayer;
	import edu.arizona.gui.music.Streamer;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.GradientType;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.media.SoundTransform;
	import flash.media.SoundChannel;
	import flash.ui.Mouse;
	

	public class HudBar extends Sprite {

		public static var HUD_HEIGHT:uint = 30;
		public var showhide:Button4State;

		[Embed(source = "../menu/undo_up.png")]
		private var UndoButton_UP:Class;
		[Embed(source = "../menu/undo_disable.png")]
		private var UndoButton_DISABLE:Class;
		[Embed(source = "../menu/undo_hover.png")]
		private var UndoButton_HOVER:Class;
		[Embed(source = "../menu/undo_down.png")]
		private var UndoButton_DOWN:Class;

		private var undo:Button4State;

		[Embed(source = "../menu/redo_up.png")]
		private var RedoButton_UP:Class;
		[Embed(source = "../menu/redo_disable.png")]
		private var RedoButton_DISABLE:Class;
		[Embed(source = "../menu/redo_hover.png")]
		private var RedoButton_HOVER:Class;
		[Embed(source = "../menu/redo_down.png")]
		private var RedoButton_DOWN:Class;

		private var redo:Button4State;

		[Embed(source = "../menu/1x_up.png")]
		private var x1_UP:Class;
		[Embed(source = "../menu/1x_hover.png")]
		private var x1_HOVER:Class;
		[Embed(source = "../menu/1x_down.png")]
		private var x1_DOWN:Class;

		private var x1:ButtonSpeedControl;

		[Embed(source = "../menu/2x_up.png")]
		private var x2_UP:Class;
		[Embed(source = "../menu/2x_hover.png")]
		private var x2_HOVER:Class;
		[Embed(source = "../menu/2x_down.png")]
		private var x2_DOWN:Class;

		private var x2:ButtonSpeedControl;

		[Embed(source = "../menu/4x_up.png")]
		private var x4_UP:Class;
		[Embed(source = "../menu/4x_hover.png")]
		private var x4_HOVER:Class;
		[Embed(source = "../menu/4x_down.png")]
		private var x4_DOWN:Class;

		private var x4:ButtonSpeedControl;

		[Embed(source = "../menu/showhide_up.png")]
		private var ShowHideButton_UP:Class;
		[Embed(source = "../menu/showhide_disabled.png")]
		private var ShowHideButton_DISABLE:Class;
		[Embed(source = "../menu/showhide_hover.png")]
		private var ShowHideButton_HOVER:Class;
		[Embed(source = "../menu/showhide_down.png")]
		private var ShowHideButton_DOWN:Class;
		//showhide is declared at top, since it needs to be public for utility reasons (look at GamePage click function)

		[Embed(source = "../menu/restart_up.png")]
		private var RestartButton_UP:Class;
		[Embed(source = "../menu/restart_hover.png")]
		private var RestartButton_HOVER:Class;
		[Embed(source = "../menu/restart_down.png")]
		private var RestartButton_DOWN:Class;

		private var restart:Button3State;

		[Embed(source = "../menu/quit_up.png")]
		private var QuitButton_UP:Class;
		[Embed(source = "../menu/quit_hover.png")]
		private var QuitButton_HOVER:Class;
		[Embed(source = "../menu/quit_down.png")]
		private var QuitButton_DOWN:Class;

		private var quit:Button3State;

		[Embed(source = "../menu/finish_up.png")]
		private var FinishButton_UP:Class;
		[Embed(source = "../menu/finish_hover.png")]
		private var FinishButton_HOVER:Class;
		[Embed(source = "../menu/finish_down.png")]
		private var FinishButton_DOWN:Class;

		private var finishBtn:Button3State;

		[Embed(source = "../menu/done.png")]
		private var DoneImage:Class;

		private var alert:Sprite;

		[Embed(source = "../menu/yes_up.png")]
		private var YesButton_UP:Class;
		[Embed(source = "../menu/yes_hover.png")]
		private var YesButton_HOVER:Class;
		[Embed(source = "../menu/yes_down.png")]
		private var YesButton_DOWN:Class;

		private var yes:Button3State;

		[Embed(source = "../menu/no_up.png")]
		private var NoButton_UP:Class;
		[Embed(source = "../menu/no_hover.png")]
		private var NoButton_HOVER:Class;
		[Embed(source = "../menu/no_down.png")]
		private var NoButton_DOWN:Class;

		private var no:Button3State;

		[Embed(source = "../menu/offscreen_up.png")]
		private var OffscreenButton_UP:Class;
		[Embed(source = "../menu/offscreen_hover.png")]
		private var OffscreenButton_HOVER:Class;
		[Embed(source = "../menu/offscreen_down.png")]
		private var OffscreenButton_DOWN:Class;
		private var offscreen:Button3State;
		
		[Embed(source = "../menu/menu_button_up.png")]
		private var MenuButton_UP:Class;
		[Embed(source = "../menu/menu_button_hover.png")]
		private var MenuButton_HOVER:Class;
		[Embed(source = "../menu/menu_button_down.png")]
		private var MenuButton_DOWN:Class;
		[Embed(source = "../menu/menu_button_disabled.png")]
		private var MenuButton_DISABLE:Class;
		private var menu:Button4State;
		
		[Embed(source = "../menu/pen_button_up.png")]
		private var PenButton_UP:Class;
		[Embed(source = "../menu/pen_button_hover.png")]
		private var PenButton_HOVER:Class;
		[Embed(source = "../menu/pen_button_down.png")]
		private var PenButton_DOWN:Class;
		[Embed(source = "../menu/pen_button_disabled.png")]
		private var PenButton_DISABLE:Class;
		private var pen:Button4State;
		
		[Embed(source = "../menu/sound_button_up.png")]
		private var SoundButton_UP:Class;
		[Embed(source = "../menu/sound_button_hover.png")]
		private var SoundButton_HOVER:Class;
		[Embed(source = "../menu/sound_button_down.png")]
		private var SoundButton_DOWN:Class;
		[Embed(source = "../menu/sound_button_disabled.png")]
		private var SoundButton_DISABLE:Class;
		private var sound:Button4State;
		
		[Embed(source = "../menu/next_button_up.png")]
		private var NextButton_UP:Class;
		[Embed(source = "../menu/next_button_hover.png")]
		private var NextButton_HOVER:Class;
		[Embed(source = "../menu/next_button_down.png")]
		private var NextButton_DOWN:Class;
		private var next:Button3State;
		
		public var showMenu:Boolean = false;
		public var haveSound:Boolean = true;
		public var havePen:Boolean = false;
		public var showLines:Boolean = true;
		
		private var progress:ProgressBar;
		private var yt:YouTubePlayer;
		private var to:TouchOverlay;

		public var stream:Streamer;
		
		public function HudBar(w:uint, h:uint, yt:YouTubePlayer, to:TouchOverlay) {
			stream = new Streamer(this);
			stream.nextSong();
			this.yt = yt;
			this.to = to;
			drawBar(w, h);
			initButtons(w, h);
			initAlert(w, h);
		}

		private function drawBar(w:uint, h:uint):void {
			var colors:Array = [0xFFFFFF, 0xcbcbcb];
			var alphas:Array = [1, 1];
			var ratios:Array = [0, 255];
			var m:Matrix = new Matrix();
			m.createGradientBox(w, HUD_HEIGHT, Math.PI / 2);

			var hudBG:Sprite = new Sprite();
			hudBG.y = h - HUD_HEIGHT;
			hudBG.graphics.lineStyle();
			hudBG.graphics.beginGradientFill(GradientType.LINEAR, colors, alphas, ratios, m);
			hudBG.graphics.drawRect(0, 0, w, HUD_HEIGHT);
			hudBG.graphics.endFill();
			hudBG.graphics.beginFill(0xb4b4b4);
			hudBG.graphics.drawRect(0, HUD_HEIGHT - 1, w, 1);
			hudBG.graphics.endFill();
			addChild(hudBG);
		}

		private function initButtons(w:uint, h:uint):void {
			undo = new Button4State(new UndoButton_UP(),
									new UndoButton_HOVER(),
									new UndoButton_DOWN(),
									new UndoButton_DISABLE());
			undo.isDisabled = true;
			undo.x = 0;
			undo.y = h - HUD_HEIGHT;
			addChild(undo);

			redo = new Button4State(new RedoButton_UP(),
									new RedoButton_HOVER(),
									new RedoButton_DOWN(),
									new RedoButton_DISABLE());
			redo.isDisabled = true;
			redo.x = undo.width;
			redo.y = h - HUD_HEIGHT;
			addChild(redo);

			quit = new Button3State(new QuitButton_UP(),
									new QuitButton_HOVER(),
									new QuitButton_DOWN());
			quit.x = w - quit.width;
			quit.y = h - HUD_HEIGHT;
			addChild(quit);

			restart = new Button3State(new RestartButton_UP(),
									   new RestartButton_HOVER(),
									   new RestartButton_DOWN());
			restart.x = quit.x - restart.width;
			restart.y = h - HUD_HEIGHT;
			addChild(restart);

			finishBtn = new Button3State(new FinishButton_UP(),
										 new FinishButton_HOVER(),
										 new FinishButton_DOWN());
			finishBtn.x = restart.x - finishBtn.width;
			finishBtn.y = h - HUD_HEIGHT;
			addChild(finishBtn);

			x1 = new ButtonSpeedControl(new x1_UP(),
										new x1_HOVER(),
										new x1_DOWN());
			x1.x = redo.x + redo.width;
			x1.y = redo.y;
			ButtonSpeedControl.makeSelected(x1);
			x1.addEventListener(MouseEvent.CLICK, onSpeedClick, false, 0, true);
			addChild(x1);

			x2 = new ButtonSpeedControl(new x2_UP(),
										new x2_HOVER(),
										new x2_DOWN());
			x2.x = x1.x + x1.width;
			x2.y = x1.y;
			x2.addEventListener(MouseEvent.CLICK, onSpeedClick, false, 0, true);
			addChild(x2);

			x4 = new ButtonSpeedControl(new x4_UP(),
										new x4_HOVER(),
										new x4_DOWN());
			x4.x = x2.x + x2.width;
			x4.y = x2.y;
			x4.addEventListener(MouseEvent.CLICK, onSpeedClick, false, 0, true);
			addChild(x4);

			
			menu = new Button4State(new MenuButton_UP(),
									new MenuButton_HOVER(),
									new MenuButton_DOWN(),
									new MenuButton_DISABLE(), true);
									
			menu.x = x4.x + x4.width;
			menu.y = x4.y;
			menu.isDisabled = false;
			addChild(menu);
			
			var bg:Sprite = new Sprite();
			bg.graphics.beginFill(0xFFFFFF);
			bg.graphics.drawRect(0, -50, 900, 50);
			bg.graphics.endFill();
			addChild(bg);

			offscreen = new Button3State(new OffscreenButton_UP(),
										 new OffscreenButton_HOVER(),
										 new OffscreenButton_DOWN());
			offscreen.x = 0;
			offscreen.y = -50;
			addChild(offscreen);

			progress = new ProgressBar(69);
			progress.x = menu.x + menu.width;
			progress.y = menu.y;
			addChild(progress);
			
			
			showhide = new Button4State(new ShowHideButton_UP(),
										new ShowHideButton_HOVER(),
										new ShowHideButton_DOWN(),
										new ShowHideButton_DISABLE(), true);
			showhide.x = menu.x - 4;
			showhide.y = menu.y - menu.height;
			
			pen = new Button4State(new PenButton_UP(),
									new PenButton_HOVER(),
									new PenButton_DOWN(),
									new PenButton_DISABLE(), true);
			pen.x = showhide.x + showhide.width;
			pen.y = menu.y - menu.height;
			pen.isDisabled = true;
			
			sound = new Button4State(new SoundButton_UP(),
									new SoundButton_HOVER(),
									new SoundButton_DOWN(),
									new SoundButton_DISABLE(), true);
			sound.x = pen.x + pen.width;
			sound.y = menu.y - menu.height;
			
			next = new Button3State(new NextButton_UP(),
									new NextButton_HOVER(),
									new NextButton_DOWN());
			next.x = sound.x + sound.width;
			next.y = menu.y - menu.height;
			
			//menu.isDisabled = true;
			//menu.addEventListener(MouseEvent.CLICK, onShowHideClick, false, 0, true);
			addChild(next);
			addChild(sound);
			addChild(pen);
			addChild(showhide);
			next.visible = false;
			sound.visible = false;
			pen.visible = false;
			showhide.visible = false;
			addPenEvent(penAction);
			addLineEvent(onShowHideClick);
			addMenuEvent(showHideMenuAction);
			addSoundEvent(soundAction);
			addNextEvent(nextAction);
		}

		private function onSpeedClick(evt:MouseEvent):void {
			ButtonSpeedControl.makeSelected(evt.target as ButtonSpeedControl);
			if (evt.target == x1) {
				yt.setSpeed1x();
			} else if (evt.target == x2) {
				yt.setSpeed2x();
			} else if (evt.target == x4) {
				yt.setSpeed4x();
			}
		}

		private function onShowHideClick(evt:MouseEvent):void {
			to.visible = showhide.isDisabled;
			Mouse.show();
			showhide.isDisabled = !showhide.isDisabled;
		}
		/*
		public function showLineAction(evt:MouseEvent) { 
			showLines = !showLines;
			if(showLines){
				}else{
			}
			showhide.isDisabled = !showhide.isDisabled;
		}*/
		
		public function nextAction(evt:MouseEvent) {
			stream.nextSong();
		}
		
		public function penAction(evt:MouseEvent) {
			/*
			havePen = !havePen;
			if(havePen){
				}else{
			}*/
			to.setStyle();
			pen.isDisabled = !pen.isDisabled;
		}
		
		public function soundAction(evt:MouseEvent) {
			haveSound = !haveSound;
			
			if (haveSound) {
				var unmute:SoundTransform = new SoundTransform(1, 0);
				stream.sndChannel.soundTransform = unmute;
			}else{
				var mute:SoundTransform = new SoundTransform(0, 0);
				stream.sndChannel.soundTransform = mute;
			}
			sound.isDisabled = !sound.isDisabled;
		}
		
		public function showHideMenuAction(evt:MouseEvent){
			showMenu = !showMenu;
			if (showMenu) { 
				next.visible = true;
				sound.visible = true;
				pen.visible = true;
				showhide.visible = true;				
			}
			else {
				next.visible = false;
				sound.visible = false;
				pen.visible = false;
				showhide.visible = false;
			}
			//to.visible = showhide.isDisabled;
			menu.isDisabled = !menu.isDisabled;
		}
		
		public function addMenuEvent(f:Function):void {
			menu.addEventListener(MouseEvent.CLICK, f, false, 0, true);
		}
		
		public function addSoundEvent(f:Function):void {
			sound.addEventListener(MouseEvent.CLICK, f, false, 0, true);
		}
		
		public function addNextEvent(f:Function):void {
			next.addEventListener(MouseEvent.CLICK, f, false, 0, true);
		}
		
		public function addPenEvent(f:Function):void {
			pen.addEventListener(MouseEvent.CLICK, f, false, 0, true);
		}
		
		public function addLineEvent(f:Function):void {
			showhide.addEventListener(MouseEvent.CLICK, f, false, 0, true);
		}
		
		private function initAlert(w:uint, h:uint):void {
			alert = new Sprite();

			var done:Bitmap = new DoneImage();
			done.alpha = 0.65;	// see replay behind transparent finish alert
			alert.addChild(done);

			yes = new Button3State(new YesButton_UP(),
								   new YesButton_HOVER(),
								   new YesButton_DOWN());
			yes.y = done.height;
			yes.alpha = 0.65;
			alert.addChild(yes);

			no = new Button3State(new NoButton_UP(),
								  new NoButton_HOVER(),
								  new NoButton_DOWN());
			no.x = yes.width;
			no.y = yes.y;
			no.alpha = 0.65
			alert.addChild(no);

			alert.x = w / 2 - alert.width / 2;
			alert.y = h / 2 - alert.height / 2;
			alert.visible = false;
		}

		public function setProgress(v:Number):Boolean {
			progress.progress = v;
			return progress.isDone();
		}

		public function setDuration(v:Number):void {
			progress.duration = v;
		}

		public function addQuitEvent(f:Function):void {
			quit.addEventListener(MouseEvent.CLICK, f, false, 0, true);
		}

		public function addUndoEvent(f:Function):void {
			undo.addEventListener(MouseEvent.CLICK, f, false, 0, true);
		}

		public function addRedoEvent(f:Function):void {
			redo.addEventListener(MouseEvent.CLICK, f, false, 0, true);
		}

		public function addRestartEvent(f:Function):void {
			restart.addEventListener(MouseEvent.CLICK, f, false, 0, true);
		}

		public function addYesEvent(f:Function):void {
			yes.addEventListener(MouseEvent.CLICK, f, false, 0, true);
		}

		public function addNoEvent(f:Function):void {
			no.addEventListener(MouseEvent.CLICK, f, false, 0, true);
		}

		public function addFinishEvent(f:Function):void {
			finishBtn.addEventListener(MouseEvent.CLICK, f, false, 0, true);
		}

		public function set undoDisabled(b:Boolean):void {
			undo.isDisabled = b;
		}

		public function get undoDisabled():Boolean {
			return undo.isDisabled;
		}

		public function set redoDisabled(b:Boolean):void {
			redo.isDisabled = b;
		}

		public function get redoDisabled():Boolean {
			return redo.isDisabled;
		}

		public function prepareToCount():void {
			progress.visible = false;
			x1.visible = false;
			x2.visible = false;
			x4.visible = false;
			finishBtn.visible = true;
			showhide.x = redo.x + redo.width;
			offscreen.visible = false;
			showOverlay();
		}

		public function prepareToTrack():void {
			progress.visible = true;
			x1.visible = true;
			x2.visible = true;
			x4.visible = true;
			finishBtn.visible = false;
			showhide.x = x4.x + x4.width;
			offscreen.visible = true;
			showOverlay();
		}

		public function showOverlay():void {
			to.visible = true;
			showhide.isDisabled = false;
		}

		public function finish(circle:DisplayObject, w:uint, h:uint):void {
			var useRight:Boolean = false;
			var useDown:Boolean = false;
			if (circle.x > w / 2)
				useRight = true;
			if (circle.y > (h - HudBar.HUD_HEIGHT) / 2)
				useDown = true;
			if (useRight && useDown) {
				alert.x = circle.x - 139;
				alert.y = circle.y - circle.height - alert.height + 40;
			} else if (!useRight && useDown) {
				alert.x = circle.x - 45;
				alert.y = circle.y - circle.height - alert.height + 40;
			} else if (useRight && !useDown) {
				alert.x = circle.x - 138;
				alert.y = circle.y + circle.height - 40;
			} else if (!useRight && !useDown) {
				alert.x = circle.x - 45;
				alert.y = circle.y + circle.height - 40;
			}

			alert.visible = true;
			addChild(alert);
		}

		public function hideAlert():void {
			if (alert.visible) {
				alert.visible = false;
				removeChild(alert);
			}
		}
	}
}