package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author d_nishimura
	 */
	public class ClickTest extends Sprite
	{
		private var rect : Sprite = null;
		private var under : Sprite = null;
		private var target : Sprite = null;
		private var text : TextField = null;
		
		private var layerUnder : Sprite = null;
		private var layerUp : Sprite = null;
		
		public function ClickTest() 
		{
			under = new Sprite();
			addChild( under );
			under.x = 300;
			under.y = 300;
			under.graphics.beginFill( 0x00FFFF );
			under.graphics.drawRect( 0, 0, 100, 100);
			under.graphics.endFill();
			under.addEventListener( MouseEvent.MOUSE_OVER, mouseover );
			under.addEventListener( MouseEvent.MOUSE_OUT, mouseout );
			
			rect = new Sprite();
			addChild( rect );
			
			rect.x = 100;
			rect.y = 100;
			rect.graphics.beginFill( 0xFF0000 );
			rect.graphics.drawRect( 0, 0, 100, 100);
			rect.graphics.endFill();
			
			rect.addEventListener( MouseEvent.MOUSE_DOWN, mousedown );
			rect.addEventListener( MouseEvent.MOUSE_UP, mouseup );
			
			addEventListener( Event.ADDED_TO_STAGE, added );
			
			text = new TextField();
			addChild( text );
		}
		private function enter( e : Event ):void
		{
			text.text = "mouse pos : " + stage.mouseX + ", " + stage.mouseY;
			if ( target != null )
			{
				target.x = stage.mouseX;
				target.y = stage.mouseY;
			}
		}
		private function added( e : Event ):void
		{
			//stage.addEventListener( MouseEvent.MOUSE_UP, forceUp );
			//stage.addEventListener( MouseEvent.MOUSE_DOWN, forceDown );
			stage.addEventListener( Event.ENTER_FRAME, enter );
		}
		
		private function mouseover( e : MouseEvent ):void
		{
			var sprite : Sprite = e.target as Sprite;
			sprite.scaleX = 2.0;
			sprite.scaleY = 2.0;
		}
		private function mouseout( e : MouseEvent ):void
		{
			var sprite : Sprite = e.target as Sprite;
			sprite.scaleX = 1.0;
			sprite.scaleY = 1.0;
		}
		private function mousedown( e : MouseEvent ):void
		{
			var sprite : Sprite = e.target as Sprite;
			target = sprite;
			//sprite.mouseEnabled = false;
		}
		private function mouseup( e : MouseEvent ):void
		{
			target = null;
			//sprite.stopDrag();
			//sprite.mouseEnabled = true;
		}
		private function forceUp( e : MouseEvent ):void
		{
			var sprite : Sprite = target;
			//sprite.stopDrag();
			//sprite.mouseEnabled = true;
		}
		private function forceDown( e : MouseEvent ):void
		{
			var sprite : Sprite = rect;
			//rect.dispatchEvent( MouseEvent );
		}
	}

}