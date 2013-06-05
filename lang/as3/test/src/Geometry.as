package  
{
	/**
	 * ...
	 * @author d_nishimura
	 */
	public class Geometry
	{
		public static function GetVectorLength( vecx : Number, vecy : Number ) : Number
		{
			var xVal : Number = 0;
			var yVal : Number = 0;
			if ( vecx == 0 )
			{
				if ( vecy == 0 )
				{
					return 0;
				}
				else
				{
					yVal = Math.pow( vecy, 2 );
				}
			}
			else
			{
				xVal = Math.pow( vecx, 2 );
			}
			return Math.sqrt( xVal + yVal );
		}
	}

}