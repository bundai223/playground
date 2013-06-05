package tweentest
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import mx.effects.*;
	import mx.effects.easing.*;
	import mx.effects.effectClasses.*;
	/**
	 * ...
	 * @author d_nishimura
	 */
	public class Main extends Sprite 
	{
		private const TEST_NUM : uint = 1;
		
		private var m_SpriteList : Array = null;
		
		public function Main():void 
		{
			m_SpriteList = new Array();
			for ( var i : uint = 0; i < TEST_NUM; ++i )
			{
				m_SpriteList[i] = new tweenSp( 400, 350, 1000 );
				addChild( m_SpriteList[i] );
			}
			
			if (stage) init();  
			else addEventListener(Event.ADDED_TO_STAGE, init);  
		}
		
		private function init( e : Event = null ) : void
		{
			var ts : tweenSp = null;
			
			for ( var i : uint = 0; i < TEST_NUM; ++i )
			{
				ts = m_SpriteList[i];
				ts.SetEasingType( tweenSp.EASING_BACK, tweenSp.TYPE_OUT );
				ts.x = 50 + 30 * i;
				ts.y = 50;
				ts.startAnim();
			}
		}
	}
}