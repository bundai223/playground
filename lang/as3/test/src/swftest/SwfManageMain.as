package swftest 
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author d_nishimura
	 */
	public class SwfManageMain extends Sprite
	{
		private var m_SwfLoader : Loader = null;
		private var m_SwfUrl : URLRequest = null;
		
		private var m_InputSwf : Object = null;
		private var m_CloseButton : Sprite = null;
		private var m_bOpen : Boolean = false;
		
		public function SwfManageMain() 
		{
			m_CloseButton = new Sprite();
			m_CloseButton.graphics.beginFill( 0xff0000 );
			m_CloseButton.graphics.drawCircle( 0, 0, 50 );
			m_CloseButton.graphics.endFill();
			addChild( m_CloseButton );
			m_CloseButton.addEventListener( MouseEvent.CLICK, _ClickFunc );
			
			m_SwfLoader = new Loader();
			m_SwfUrl = new URLRequest( "InputWnd.swf" );
			m_SwfLoader.contentLoaderInfo.addEventListener( Event.INIT, _InitFunc );
			
			m_SwfLoader.load(m_SwfUrl);
		}
		
		private function _InitFunc( e : Event ) : void
		{
			Debug.printf( "" + m_SwfLoader.content );
			m_InputSwf = m_SwfLoader.content as Object;
			m_InputSwf.x = 100;
			m_InputSwf.y = 100;
			addChild( m_InputSwf as Sprite );
			
			m_InputSwf.Open();
			m_bOpen = true;
		}
		private function _ClickFunc( e : MouseEvent ) : void
		{
			if ( m_InputSwf != null )
			{
				if ( m_bOpen == true )
				{
					Debug.printf( m_InputSwf.GetInputStr() );
					m_InputSwf.Close();
					m_bOpen = false;
				}
				else
				{
					m_InputSwf.Open();
					m_bOpen = true;
				}
			}
		}
		
	}

}