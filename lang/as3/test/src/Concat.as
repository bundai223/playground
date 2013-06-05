package  
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author d_nishimura
	 */
	public class Concat extends Sprite
	{
		private var list0:Array = null;
		private var list1:Array = null;
		
		private var active:Array = null;
		
		public function Concat() 
		{
			list0 = new Array( {id: 1},{ id : 2},{ id : 3},{id : 4},{id : 5} );
			list1 = new Array( {id : 10}, {id : 11}, {id : 12}, {id : 13}, {id : 14});
			
			Debug.printf("list0 : " + (int)(list0[0].id));
			Debug.printf("list1 : " + (int)(list1[0].id));
			active = list0.concat( list1 );
			Debug.printf("active : " + (int)(active[0].id));
			
			active[0].id += 100;
			Debug.printf("\nlist0 : " + (int)(list0[0].id));
			Debug.printf("list1 : " + (int)(list1[0].id));
			Debug.printf("active : " + (int)(active[0].id));
		}
		
	}

}