package swftest 
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	
	/**
	 * ...
	 * @author d_nishimura
	 */
	public class WindowSwfMain extends Sprite
	{
		private var m_InputField : TextField = null;
		
		public function WindowSwfMain() 
		{
			visible = false;
			m_InputField = new TextField();
			m_InputField.type = TextFieldType.INPUT;
			m_InputField.selectable = true;
			m_InputField.mouseEnabled = true;
			m_InputField.text = "default";
			
			graphics.lineStyle( 3 );
			graphics.drawRect( 0, 0, 300, 100);
		}
		
		public function Open() : void
		{
			visible = true;
			addChild( m_InputField );
		}
		public function Close() : void
		{
			visible = false;
			removeChild( m_InputField );
		}
		public function GetInputStr():String
		{
			return m_InputField.text;
		}
		
	}

}