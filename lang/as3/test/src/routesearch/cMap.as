package routesearch 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author d_nishimura
	 */
	public class cMap extends Sprite
	{
		public static const MAP_WIDTH : uint	= 10;
		public static const MAP_HEIGHT : uint	= 10;
		public static const BLOCK_SIZE : Number	= 50;
		
		public static const DEFAULT_WIDTH : uint = 5;
		public static const DEFAULT_HEIGHT : uint = 5;
		
		public static const DEFAULT_START_X : uint = 0;
		public static const DEFAULT_START_Y : uint = 0;
		public static const DEFAULT_GOAL_X : uint = 4;
		public static const DEFAULT_GOAL_Y : uint = 4;
		
		public static const NEXT_TYPE_UP : uint		= 0;
		public static const NEXT_TYPE_DOWN : uint	= 1;
		public static const NEXT_TYPE_RIGHT : uint	= 2;
		public static const NEXT_TYPE_LEFT : uint	= 3;
		public static const NEXT_TYPE_NUM : uint	= 4;
		
		private var m_MapInfo : Array = null;
		
		public function cMap() 
		{
			// マップ情報生成
			var block : cBlock = null;
			m_MapInfo = new Array( MAP_HEIGHT );
			for ( var mapy : uint = 0; mapy < MAP_HEIGHT; ++mapy )
			{
				m_MapInfo[mapy] = new Array( MAP_WIDTH );
				for ( var mapx : uint = 0; mapx < MAP_WIDTH; ++mapx )
				{
					block = new cBlock( mapx * BLOCK_SIZE, mapy * BLOCK_SIZE, BLOCK_SIZE, BLOCK_SIZE );
					addChild( block );
					if ( mapx < DEFAULT_WIDTH && mapy < DEFAULT_HEIGHT )
					{
						// 一マスだけデフォルトの開始地点
						if ( mapx == DEFAULT_START_X && mapy == DEFAULT_START_Y )
						{
							block.SetStart();
						}
						else if ( mapx == DEFAULT_GOAL_X && mapy == DEFAULT_GOAL_Y )
						{
							block.SetGoal();
						}
						else
						{
							block.SetEnable();
						}
					}
					else
					{
						block.SetDisable();
					}
					m_MapInfo[mapy][mapx] = block;
				}
			}
			// イベント作成
			addEventListener( MouseEvent.CLICK, _Pushed );
		}
		
		// マウス設定
		public function EnableMouse() : void
		{
			mouseChildren = true;
			mouseEnabled = true;
		}
		public function DisableMouse() : void
		{
			mouseChildren = false;
			mouseEnabled = false;
		}
		
		// ブロックの座標をもらう
		public function GetBlockPos( bl : cBlock ) : Object
		{
			Debug.assert( bl != null, "assert ! " + this + "_GetBlockPos : bl is nullpo!" );
			
			var block : cBlock = null;
			for ( var mapy : uint = 0; mapy < MAP_HEIGHT; ++mapy )
			{
				for ( var mapx : uint = 0; mapx < MAP_WIDTH; ++mapx )
				{
					block = GetBlock( mapx, mapy );
					if ( bl == block )
					{
						return { _x : mapx, _y : mapy };
					}
				}
			}
			return null;
		}
		
		// ブロックをもらう
		public function GetBlock( blockX : uint, blockY : uint ) : cBlock
		{
			Debug.assert( blockX < MAP_WIDTH, "assert ! " + this + "GetBlock : blockX is over!" );
			Debug.assert( blockY < MAP_HEIGHT, "assert ! " + this + "GetBlock : blockY is over!" );
			return m_MapInfo[blockY][blockX];
		}
		
		public function GetNextBlock( block : cBlock, nextType : uint ) : cBlock
		{
			Debug.assert(block != null, "assert ! " + this + "GetNextBlock : block is nullpo!" );
			Debug.assert(nextType < NEXT_TYPE_NUM, "assert ! " + this + "GetNextBlock : nextType is over[" + nextType + "]" );
			
			var posObj : Object = GetBlockPos( block );
			var myx : int = posObj._x;
			var myy : int = posObj._y;
			var retBlock : cBlock = null;
			
			switch( nextType )
			{
				// 下
				case NEXT_TYPE_DOWN:
				{
					// 一番下の段以外で…
					if ( myy < MAP_HEIGHT - 1 )
					{
						retBlock = GetBlock( myx, myy + 1 );
					}
				} break;
				// 上
				case NEXT_TYPE_UP:
				{
					// 一番上の段以外で…
					if ( myy > 0 )
					{
						retBlock = GetBlock( myx, myy - 1 );
					}
				} break;
				// 右
				case NEXT_TYPE_RIGHT:
				{
					// 一番右の列以外で…
					if ( myx < MAP_WIDTH - 1 )
					{
						retBlock = GetBlock( myx + 1, myy );
					}
				} break;
				// 左
				case NEXT_TYPE_LEFT:
				{
					// 一番左の列以外で…
					if ( myx > 0 )
					{
						retBlock = GetBlock( myx - 1, myy );
					}
				} break;
			}
			
			return retBlock;
		}
		
		// スタートブロック検索
		public function GetStartBlock() : cBlock
		{
			var block : cBlock = null;
			for ( var mapy : uint = 0; mapy < MAP_HEIGHT; ++mapy )
			{
				for ( var mapx : uint = 0; mapx < MAP_WIDTH; ++mapx )
				{
					block = GetBlock( mapx, mapy );
					if ( block.IsStart() == true )
					{
						return block;
					}
				}
			}
			return null;
		}
		// ゴールブロック検索
		public function GetGoalBlock() : cBlock
		{
			var block : cBlock = null;
			for ( var mapy : uint = 0; mapy < MAP_HEIGHT; ++mapy )
			{
				for ( var mapx : uint = 0; mapx < MAP_WIDTH; ++mapx )
				{
					block = GetBlock( mapx, mapy );
					if ( block.IsGoal() == true )
					{
						return block;
					}
				}
			}
			return null;
		}
		// 押されたとき
		private function _Pushed( e : MouseEvent ) : void
		{
			var route : cRoute = cRoute.Instance;
			var pushBlock : cBlock = e.target as cBlock;
			var startBlock : cBlock = GetStartBlock();
			var goalBlock : cBlock = GetGoalBlock();
			
			// 拡張モード
			if ( route.IsExtendMode() )
			{
				if ( pushBlock.IsEnable() == true )
				{
					pushBlock.SetDisable();
				}
				else if( pushBlock.IsDisable() == true )
				{
					pushBlock.SetEnable();
				}
			}
			// 開始地点選択モード
			else if ( route.IsStartSelectMode() )
			{
				if ( pushBlock != startBlock )
				{
					if ( pushBlock.IsDisable() == false )
					{
						pushBlock.SetStart();
						startBlock.SetEnable();
					}
				}
			}
			// ゴール地点選択モード
			else if ( route.IsGoalSelectMode() )
			{
				if ( pushBlock != goalBlock )
				{
					if ( pushBlock.IsDisable() == false )
					{
						pushBlock.SetGoal();
						goalBlock.SetEnable();
					}
				}
			}
		}
		
	}

}