package  
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	 * ...
	 * @author d_nishimura
	 */
	public class NewLine extends Sprite
	{
		private var m_Text : TextField = null;
		
		public function NewLine() 
		{
			m_Text = new TextField();
			m_Text.x = 100;
			m_Text.y = 100;
			
			var format : TextFormat = new TextFormat();
			format.align = TextFormatAlign.CENTER;
			m_Text.defaultTextFormat = format;
			m_Text.text = "ttttttttttttttttttttttttttttttttttttttt\n11111111111\n4444444444444444444444\n55555555555";
			m_Text.background = true;
			m_Text.backgroundColor = 0xFF0000;
			//m_Text.selectable = false;
			//m_Text.autoSize = TextFieldAutoSize.CENTER;
			
			addChild( m_Text );
			
			
			graphics.beginFill(0);
			graphics.drawRect( 100, 0, 10, 1000 );
			graphics.endFill();
		}
		
	}

}