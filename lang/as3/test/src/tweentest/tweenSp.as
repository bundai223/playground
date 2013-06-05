package tweentest 
{
	import flash.display.Sprite;
	import mx.effects.*;
	import mx.effects.easing.*;
	import mx.effects.effectClasses.*;
	
	/**
	 * ...
	 * @author d_nishimura
	 */
	public class tweenSp extends Sprite
	{
		public static const EASING_BACK : uint			= 0;
		public static const EASING_BOUNCE : uint		= 1;
		public static const EASING_CIRCULAR : uint		= 2;
		public static const EASING_ELASTIC : uint		= 3;
		public static const EASING_LINEAR : uint		= 4;
		public static const EASING_QUADRATIC : uint		= 5;
		public static const EASING_QUARTIC : uint		= 6;
		public static const EASING_QUINTIC : uint		= 7;
		public static const EASING_SINE : uint			= 8;
		public static const EASING_EXPONENTIAL : uint	= 9;
		public static const EASING_NUM : uint			= 10;
		
		public static const TYPE_IN : uint				= 0;
		public static const TYPE_INOUT : uint			= 1;
		public static const TYPE_OUT : uint				= 2;
		
		private var m_Tween : Tween = null;
		private var m_EasingFunc : Function = null;
		private var m_StartVal : Number = 0;
		private var m_EndVal : Number = 0;
		private var m_Time : Number = 0;
		
		public function tweenSp( startVal : Number, endVal : Number, time : Number ) 
		{
			graphics.beginFill( 0xff0000 );
			graphics.drawCircle( 0, 0, 10 );
			graphics.endFill();
			
			m_StartVal = startVal;
			m_EndVal = endVal;
			m_Time = time;
			m_Tween = new Tween( this, m_StartVal, m_EndVal, m_Time );
			m_Tween.setTweenHandlers( _updateTween, _endTween );
			m_Tween.pause();
		}
		
		public function SetEasingType( kind : uint, type : uint ) : void
		{
			var funcClass : Class = null;
			
			switch( kind )
			{
				case EASING_BACK:
				{
					funcClass = Back;
				} break;
				case EASING_BOUNCE:
				{
					funcClass = Bounce;
				} break;
				case EASING_CIRCULAR:
				{
					funcClass = Circular;
				} break;
				case EASING_ELASTIC:
				{
					funcClass = Elastic;
				} break;
				case EASING_LINEAR:
				{
					funcClass = Linear;
				} break;
				case EASING_QUADRATIC:
				{
					funcClass = Quadratic;
				} break;
				case EASING_QUARTIC:
				{
					funcClass = Quartic;
				} break;
				case EASING_QUINTIC:
				{
					funcClass = Quintic;
				} break;
				case EASING_SINE:
				{
					funcClass = Sine;
				} break;
				case EASING_EXPONENTIAL:
				{
					funcClass = Exponential;
				} break;
			}
			
			switch( type )
			{
				case TYPE_IN:
				{
					m_EasingFunc = funcClass["easeIn"];
				} break;
				case TYPE_INOUT:
				{
					m_EasingFunc = funcClass["easeInOut"];
				} break;
				case TYPE_OUT:
				{
					m_EasingFunc = funcClass["easeOut"];
				} break;
			}
			m_Tween.easingFunction = m_EasingFunc;
		}
		public function startAnim() : void
		{
			m_Tween.resume();
		}
		private function _updateTween( val : Number ) : void
		{
			y = val;
		}
		private function _endTween( val : Number ) : void
		{
			y = val;
			m_Tween = new Tween( this, m_StartVal, m_EndVal, m_Time );
			m_Tween.setTweenHandlers( _updateTween, _endTween );
			m_Tween.easingFunction = m_EasingFunc;
		}
	}

}