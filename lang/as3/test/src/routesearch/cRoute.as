package routesearch 
{
	import debug.DebugState;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.media.Sound;
	import flash.text.TextField;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author d_nishimura
	 */
	public class cRoute extends Sprite
	{
		public static const MAP_X : Number	= 100;
		public static const MAP_Y : Number	= 50;
		
		private static var s_Route : cRoute = null;
		
		private static const MODE_EXTEND : uint	= 0;
		private static const MODE_START_SELECT : uint	= 1;
		private static const MODE_GOAL_SELECT : uint	= 2;
		private static const MODE_MOVE : uint	= 3;
		private static const MODE_NUM : uint	= 4;
		
		
		private var m_Map : cMap = null;
		private var m_nMode : uint = 0;
		
		private var m_ExtendButton : Sprite = null;
		private var m_StartSelectButton : Sprite = null;
		private var m_GoalSelectButton : Sprite = null;
		private var m_StartButton : Sprite = null;
		private var m_ExtendText : TextField = null;
		private var m_StartSelectText : TextField = null;
		private var m_GoalSelectText : TextField = null;
		private var m_StartText : TextField = null;
		
		private var m_Mover : cMover = null;
		
		private var m_State : DebugState = null;
		public function cRoute() 
		{
			// 画面全体を塗りつぶし
			s_Route = this;
			graphics.beginFill( 0xFFFFFF );
			graphics.drawRect( 0, 0, 1000, 1000 );
			graphics.endFill();
			
			// 全体マップを配置
			m_Map = new cMap();
			m_Map.x = MAP_X;
			m_Map.y = MAP_Y;
			addChild( m_Map );
			
			// ボタンを設定
			// 拡張ボタン
			m_ExtendButton =  new Sprite();
			m_ExtendText = new TextField();
			addChild( m_ExtendButton );
			m_ExtendButton.addChild( m_ExtendText );
			m_ExtendButton.mouseChildren = false;
			m_ExtendText.text = "extend";
			m_ExtendText.selectable = false;
			m_ExtendButton.graphics.beginFill( 0x44FF88 );
			m_ExtendButton.graphics.drawRect( 0, 0, 50, 30 );
			m_ExtendButton.graphics.endFill();
			m_ExtendButton.x = 10;
			m_ExtendButton. y = 10;
			m_ExtendButton.addEventListener( MouseEvent.CLICK, _ExtendButton );
			
			// スタート選択ボタン
			m_StartSelectButton = new Sprite();
			m_StartSelectText = new TextField();
			addChild( m_StartSelectButton );
			m_StartSelectButton.addChild( m_StartSelectText );
			m_StartSelectButton.mouseChildren = false;
			m_StartSelectText.text = "start";
			m_StartSelectText.selectable = false;
			m_StartSelectButton.graphics.beginFill( 0xFF8888 );
			m_StartSelectButton.graphics.drawRect( 0, 0, 50, 30 );
			m_StartSelectButton.graphics.endFill();
			m_StartSelectButton.x = 10;
			m_StartSelectButton. y = 45;
			m_StartSelectButton.addEventListener( MouseEvent.CLICK, _StartSelectButton );
			
			// ゴール選択ボタン
			m_GoalSelectButton = new Sprite();
			m_GoalSelectText = new TextField();
			addChild( m_GoalSelectButton );
			m_GoalSelectButton.addChild( m_GoalSelectText );
			m_GoalSelectButton.mouseChildren = false;
			m_GoalSelectText.text = "goal";
			m_GoalSelectText.selectable = false;
			m_GoalSelectButton.graphics.beginFill( 0x8888FF );
			m_GoalSelectButton.graphics.drawRect( 0, 0, 50, 30 );
			m_GoalSelectButton.graphics.endFill();
			m_GoalSelectButton.x = 10;
			m_GoalSelectButton. y = 80;
			m_GoalSelectButton.addEventListener( MouseEvent.CLICK, _GoalSelectButton );
			
			// 開始ボタン
			m_StartButton = new Sprite();
			m_StartText = new TextField();
			addChild( m_StartButton );
			m_StartButton.addChild( m_StartText );
			m_StartButton.mouseChildren = false;
			m_StartText.text = "move";
			m_StartText.selectable = false;
			m_StartButton.graphics.beginFill( 0xFFFF88 );
			m_StartButton.graphics.drawRect( 0, 0, 50, 30 );
			m_StartButton.graphics.endFill();
			m_StartButton.x = 10;
			m_StartButton. y = 115;
			m_StartButton.addEventListener( MouseEvent.CLICK, _MoveButton );
			
			m_Mover = new cMover( cMap.BLOCK_SIZE, cMap.BLOCK_SIZE );
			m_Map.addChild( m_Mover );
			
			_SetMode( MODE_EXTEND );
			addEventListener( Event.ENTER_FRAME, _EnterFrame );
			
			addEventListener( Event.ADDED_TO_STAGE, _Init );
		}
		// マップ情報
		public function GetMap() : cMap { return m_Map; }
		
		// モード確認
		public function IsExtendMode() : Boolean
		{
			return ( m_nMode == MODE_EXTEND );
		}
		public function IsStartSelectMode() : Boolean
		{
			return ( m_nMode == MODE_START_SELECT );
		}
		public function IsGoalSelectMode() : Boolean
		{
			return ( m_nMode == MODE_GOAL_SELECT );
		}
		// 初期化
		private function _Init( e : Event ) : void
		{
			m_State = new DebugState( stage.frameRate );
			addChild( m_State );
		}
		
		// モード設定
		private function _SetMode( mode : uint ) : void
		{
			Debug.assert( mode < MODE_NUM, "assert ! " + this + "_SetMode : mode is over" );
			
			m_nMode = mode;
			switch( m_nMode )
			{
				case MODE_EXTEND:
				{
					m_ExtendButton.visible = false;
					m_StartSelectButton.visible = true;
					m_GoalSelectButton.visible = true;
					m_StartButton.visible = true;
					
					m_Map.EnableMouse();
				} break;
				case MODE_START_SELECT:
				{
					m_ExtendButton.visible = true;
					m_StartSelectButton.visible = false;
					m_GoalSelectButton.visible = true;
					m_StartButton.visible = true;
					
					m_Map.EnableMouse();
				} break;
				case MODE_GOAL_SELECT:
				{
					m_ExtendButton.visible = true;
					m_StartSelectButton.visible = true;
					m_GoalSelectButton.visible = false;
					m_StartButton.visible = true;
					
					m_Map.EnableMouse();
				} break;
				case MODE_MOVE:
				{
					m_ExtendButton.visible = false;
					m_StartSelectButton.visible = false;
					m_GoalSelectButton.visible = false;
					m_StartButton.visible = false;
					
					m_Map.DisableMouse();
					// 
					_MoveStart();
				} break;
			}
		}
		private function _MoveStart() : void
		{
			var start : cBlock = m_Map.GetStartBlock();
			var goal : cBlock = m_Map.GetGoalBlock();
			m_Mover.SetPos( start.x, start.y );
			m_Mover.SetGoal( goal.x, goal.y );
			m_Mover.Start();
		}
		
		// 更新
		private function _EnterFrame( e : Event ) : void
		{
			switch( m_nMode )
			{
				case MODE_MOVE:
				{
					if ( m_Mover.IsEnd() )
					{
						_SetMode( MODE_EXTEND );
					}
				} break;
			}
			if ( m_State )
			{
				m_State.Update();
			}
		}
		
		private function _ExtendButton( e : MouseEvent ) : void
		{
			_SetMode( MODE_EXTEND );
		}
		private function _StartSelectButton( e : MouseEvent ) : void
		{
			_SetMode( MODE_START_SELECT );
		}
		private function _GoalSelectButton( e : MouseEvent ) : void
		{
			_SetMode( MODE_GOAL_SELECT );
		}
		private function _MoveButton( e : MouseEvent ) : void
		{
			_SetMode( MODE_MOVE );
		}
		
		// 自分を取得
		static public function get Instance():cRoute { return s_Route; }
		
	}

}