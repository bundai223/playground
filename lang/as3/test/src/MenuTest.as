package  
{
	import flash.events.Event;
	import image.UIImage;
	/**
	 * ...
	 * @author d_nishimura
	 */
	public class MenuTest extends cSpriteBase
	{
		
		public function MenuTest() 
		{
			OnCenterX();
			OnCenterY();
			addEventListener( Event.ADDED_TO_STAGE, _Init );
			var i : uint = 10;
			Debug.printf( "param : " + i);
			setParam( 0, i );
			Debug.printf( "param : " + i);
		}
		private function setParam( inParam : Object, outParam : Object ):void
		{
			Debug.printf( "Set Param : outParam[" + outParam + "] to inParam[" + inParam + "]");
			outParam = inParam;
		}
		
		private function _Init( e : Event ):void
		{
			graphics.beginFill( 0xCCCCCC );
			graphics.drawRect( -400, -300, 800, 600);
			graphics.endFill();
			
			Debug.printf("stage width : " + stage.width + ", " + stage.height);
			
			SetXY( 350, 350 );
			
			var sun : cSpriteBase = new cSpriteBase();
			sun.OnCenterX();
			sun.OnCenterY();
			sun.graphics.beginFill(0xFF0000);
			sun.graphics.drawRect( 0, 0, 100, 100);
			sun.graphics.endFill();
			sun.SetXY(0, 0);
			addChild(sun);
			
			
			UpdateMtx();
			sun.UpdateMtx();
		}
	}

}