package routesearch 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author d_nishimura
	 */
	public class cMover extends Sprite
	{
		private static const MOVER_COLOR : uint	= 0xFFFF00;
		
		private static const MOVE_SPEED : Number	= 10;
		
		private static const MODE_WAIT : uint = 0;
		private static const MODE_MOVE : uint = 1;
		private static const MODE_END : uint = 0;
		
		// 
		private var m_nMode : uint			= 0;
		private var m_fBlockWidth : Number	= 0;
		private var m_fBlockHeight : Number = 0;
		
		private var m_DstPointX : Number	= 0;
		private var m_DstPointY : Number	= 0;
		private var m_GoalX : Number		= 0;
		private var m_GoalY : Number		= 0;
		private var m_DstPointStack : Array	= null;
		private var m_fMoveSpeed : Number	= MOVE_SPEED;
		private var m_MoveCount : uint		= 0;
		
		private var m_aOpenList : Array		= null;
		private var m_aClosedList : Array	= null;
		
		public function cMover( w : Number, h : Number ) 
		{
			m_DstPointStack = new Array();
			m_aOpenList = new Array();
			m_aClosedList = new Array();
			
			// マウスきり
			mouseEnabled = false;
			mouseChildren = false;
			
			// ブロックサイズ
			m_fBlockWidth = w;
			m_fBlockHeight = h;
			
			graphics.beginFill( MOVER_COLOR );
			graphics.drawCircle( m_fBlockWidth / 2, m_fBlockHeight / 2, m_fBlockWidth / 3 );
			graphics.endFill();
			
			addEventListener( Event.ENTER_FRAME, _EnterFrame );
		}
		
		// 初期化
		public function Init() : void
		{
			visible = false;
			m_nMode = MODE_WAIT;
		}
		
		// 移動開始
		public function Start() : void
		{
			visible = true;
			m_nMode = MODE_MOVE;
			// 経路探査
			m_DstPointStack.splice(0);
			_SearchRoute();
			m_DstPointX = m_DstPointStack[0]._x;
			m_DstPointY = m_DstPointStack[0]._y;
			m_MoveCount = 1;
		}
		
		// 最終地点を設定
		public function SetGoal( posx : Number, posy : Number ) : void
		{
			m_GoalX = posx;
			m_GoalY = posy;
		}
		
		// 座標を設定
		public function SetPos( posx : Number, posy : Number ) : void
		{
			x = posx;
			y = posy;
		}
		
		// 移動終わったか？
		public function IsEnd() : Boolean
		{
			return ( m_nMode == MODE_END );
		}
		
		// 経路探索処理
		private function _SearchRoute() : void
		{
			// まず準備
			m_DstPointStack.splice(0);
			m_aOpenList.splice(0);
			m_aClosedList.splice(0);
			
			// 検索処理
			var result : Boolean = false;
			result = _RouteDecide();
		}
		
		// 探索
		private function _RouteDecide() : Boolean
		{
			var nowMap : cMap = cRoute.Instance.GetMap();
			var openNum : uint = 0;
			var startBlock : cBlock = nowMap.GetStartBlock();
			var goalBlock : cBlock = nowMap.GetGoalBlock();
			var nowBlock : cBlock = null;
			var nextBlock : cBlock = null;
			var startBlockPos : Object = nowMap.GetBlockPos( startBlock );
			var goalBlockPos : Object = nowMap.GetBlockPos( goalBlock );
			var nextBlockPos : Object = nowMap.GetBlockPos( startBlock );
			var diffX : Number = 0;
			var diffY : Number = 0;
			var nowObj : Object = null;
			var ofs : uint = 0;
			var i : uint = 0;
			var num : uint = 0;
			var moveCost : Number = 0;
			var costMin : Number = 0;
			var tmpCost : Number = 0;
			var result : Boolean = false;
			m_aOpenList.push( { parent : null, cost : 0, block : startBlock } );
			openNum = 1;
			
			while ( openNum > 0 )
			{
				// openlistでコストの低いものを取得
				costMin = m_aOpenList[0].cost;
				ofs = 0;
				for ( i = 1; i < openNum; ++i )
				{
					tmpCost = m_aOpenList[i].cost;
					if ( tmpCost < costMin )
					{
						costMin = tmpCost;
						ofs = i;
					}
				}
				// リストから要素を取り出す
				nowObj = m_aOpenList.splice( ofs, 1 )[0];
				nowBlock = nowObj.block;
				openNum = m_aOpenList.length;
				// 終わっているか？
				if ( nowBlock == goalBlock )
				{
					result = true;
					break;
				}
				// 終わってない
				else
				{
					m_aClosedList.push( nowBlock );
					for ( i = 0; i < cMap.NEXT_TYPE_NUM; ++i )
					{
						nextBlock = nowMap.GetNextBlock( nowBlock, i );
						// ブロックがあって・・・
						if ( nextBlock )
						{
							// 有効なブロックで・・・
							if ( nextBlock.IsDisable() == false )
							{
								// まだリストになくて・・・
								for ( ofs = 0; ofs < openNum; ++ofs )
								{
									if ( nextBlock == m_aOpenList[ofs].block )
									{
										break;
									}
								}
								// リストの中にない？
								if ( ofs == openNum )
								{
									// すでに通ったところでもないとき・・・
									if ( m_aClosedList.indexOf( nextBlock ) == -1 )
									{
										nextBlockPos = nowMap.GetBlockPos( nextBlock );
										// スタートからの距離
										tmpCost = moveCost;
										
										// ゴールまでの距離
										diffX = (Number)(goalBlockPos._x) - (Number)(nextBlockPos._x);
										diffY = (Number)(goalBlockPos._y) - (Number)(nextBlockPos._y);
										tmpCost = tmpCost + Geometry.GetVectorLength( diffX, diffY );
										m_aOpenList.push( { parent : nowObj, cost : tmpCost, block : nextBlock } );
									}
								}
							}
						}
					}
				}
				// 移動値を更新
				++moveCost;
				openNum = m_aOpenList.length;
			}
			var lastPosX : Number = x;
			var lastPosY : Number = y;
			var lastDirX : Number = 0;
			var lastDirY : Number = 0;
			var dirX : Number = 0;
			var dirY : Number = 0;
			while ( nowObj != null )
			{
				nowBlock = nowObj.block;
				dirX = nowBlock.x - lastPosX;
				dirY = nowBlock.y - lastPosY;
				// 同じ向きなら前のは捨てる
				if (	(( dirX > 0 && lastDirX > 0 ) || ( dirX < 0 && lastDirX < 0 ) || ( dirX == 0 && lastDirX == 0 )) &&
						(( dirY > 0 && lastDirY > 0 ) || ( dirY < 0 && lastDirY < 0 ) || ( dirY == 0 && lastDirY == 0 )))
				{
					m_DstPointStack.pop();
					m_DstPointStack.push( { _x : nowBlock.x, _y : nowBlock.y } );
				}
				else
				{
					m_DstPointStack.push( { _x : nowBlock.x, _y : nowBlock.y } );
				}
				lastPosX = nowBlock.x;
				lastPosY = nowBlock.y;
				lastDirX = dirX;
				lastDirY = dirY;
				nowObj = nowObj.parent;
			}
			m_DstPointStack.reverse();
			
			return result;
		}
		
		// 移動処理
		private function _Move() : void
		{
			var diffX : Number = m_DstPointX - x;
			var diffY : Number = m_DstPointY - y;
			var len : Number = Geometry.GetVectorLength( diffX, diffY );
			var movex : Number = 0;
			var movey : Number = 0;
			var remainNum : int = 0;
			
			if ( len > 0 )
			{
				movex = ( diffX / len ) * m_fMoveSpeed;
				movey = ( diffY / len ) * m_fMoveSpeed;
				x += movex;
				y += movey;
				// 右向き
				if ( movex > 0 )
				{
					if ( x > m_DstPointX )
					{
						x = m_DstPointX;
					}
				}
				// 左向き
				else
				{
					if ( x < m_DstPointX )
					{
						x = m_DstPointX;
					}
				}
				// 下向き
				if ( movey > 0 )
				{
					if ( y > m_DstPointY )
					{
						y = m_DstPointY;
					}
				}
				// 上向き
				else
				{
					if ( y < m_DstPointY )
					{
						y = m_DstPointY;
					}
				}
			}
			// 
			if ( x == m_DstPointX && y == m_DstPointY )
			{
				remainNum = m_DstPointStack.length - m_MoveCount;
				// 移動終わり
				if ( remainNum <= 0 )
				{
					m_nMode = MODE_END;
				}
				// 移動継続
				else
				{
					var obj : Object = m_DstPointStack[m_MoveCount++];
					m_DstPointX = obj._x;
					m_DstPointY = obj._y;
				}
			}
		}
		
		private function _EnterFrame( e : Event ) : void
		{
			switch( m_nMode )
			{
				case MODE_WAIT:
				case MODE_END:
				{
					
				} break;
				case MODE_MOVE:
				{
					// 移動処理
					this._Move();
				} break;
			}
		}
		
	}

}