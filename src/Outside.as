package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	
	public class Outside extends Entity
	{
		
		private var _tiles:Tilemap;
		
		[Embed(source = 'assets/tilemap.png')]
		private const WORLD_TILESET:Class;
		
		private const PATH_TILE:Number = 0;
		private const WATER_TILE:Number = 1;
		private const TALL_GRASS_TILE:Number = 2;
		private const WALL_TILE:Number = 3;
		
		private const wallOffset:Number = 11;
		
		public function Outside()
		{
			_tiles = new Tilemap(WORLD_TILESET, 640 + 2 * 16 * wallOffset, 480 + 2 * 16 * wallOffset, 16, 16);
			graphic = _tiles;
			layer = 1;
			
			_tiles.setRect(0, 0, 640/16 + 2 * wallOffset, 480/16 + 2 * wallOffset, PATH_TILE);
			
			_tiles.setRect(0, 0, wallOffset, 480/16 + wallOffset, WALL_TILE);
			_tiles.setRect(0, 0, 640/16 + 2 * wallOffset, wallOffset, WALL_TILE);
			_tiles.setRect(640/16 + wallOffset, 0, wallOffset, 480/16 + 2 * wallOffset, WALL_TILE);
			_tiles.setRect(640/16 + wallOffset, 480/16 + wallOffset, 640/16 + 2 * wallOffset, wallOffset, WALL_TILE);
		}
		
	}
}