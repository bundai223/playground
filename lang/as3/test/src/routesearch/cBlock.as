package routesearch 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author d_nishimura
	 */
	public class cBlock extends Sprite
	{
		public static const MODE_DISABLE : uint	= 0;
		public static const MODE_ENABLE : uint	= 1;
		public static const MODE_START : uint	= 2;
		public static const MODE_GOAL : uint	= 3;
		public static const MODE_NUM : uint		= 4;
		
		private static const ENABLE_COLOR : uint	= 0x44ff44;
		private static const DISABLE_COLOR : uint	= 0x444444;
		private static const START_COLOR : uint		= 0xFF0000;
		private static const GOAL_COLOR : uint		= 0x0000FF;
		
		private var m_nMode : uint = 0;
		private var m_fWidth : Number = 0;
		private var m_fHeight : Number = 0;
		
		public function cBlock( x : Number, y : Number, w : Number, h : Number ) 
		{
			this.x = x;
			this.y = y;
			m_fWidth = w;
			m_fHeight = h;
			
			_SetMode( MODE_DISABLE );
		}
		// 状態設定
		public function IsEnable() : Boolean { return _GetMode() == MODE_ENABLE; }
		public function SetEnable():void
		{
			_SetMode( MODE_ENABLE );
		}
		public function IsDisable() : Boolean { return _GetMode() == MODE_DISABLE; }
		public function SetDisable():void
		{
			_SetMode( MODE_DISABLE );
		}
		public function IsStart() : Boolean { return _GetMode() == MODE_START; }
		public function SetStart():void
		{
			_SetMode( MODE_START );
		}
		public function IsGoal() : Boolean { return _GetMode() == MODE_GOAL; }
		public function SetGoal():void
		{
			_SetMode( MODE_GOAL );
		}
		
		// 状態の設定統括
		private function _GetMode() : uint { return m_nMode; }
		private function _SetMode( mode : uint ) : void
		{
			Debug.assert( mode < MODE_NUM, "assert ! " + this + "_SetMode : mode is over" );
			m_nMode = mode;
			
			var color : uint = 0;
			switch( m_nMode )
			{
				case MODE_DISABLE:
				{
					color = DISABLE_COLOR;
				} break;
				case MODE_ENABLE:
				{
					color = ENABLE_COLOR;
				} break;
				case MODE_START:
				{
					color = START_COLOR;
				} break;
				case MODE_GOAL:
				{
					color = GOAL_COLOR;
				} break;
			}
			_DrawRect( color );
		}
		
		// 描画用
		private function _DrawRect( col : uint ) : void
		{
			graphics.clear();
			graphics.lineStyle( 1 );
			graphics.beginFill( col );
			graphics.drawRect( 0, 0, m_fWidth, m_fHeight );
			graphics.endFill();
		}
		
	}

}