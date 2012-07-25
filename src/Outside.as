package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	
	public class Outside extends Entity
	{
		
		private var _tiles:Tilemap;
		private var _grid:Grid;
		
		[Embed(source = 'assets/tilemap.png')]
		private const WORLD_TILESET:Class;
		
		private const PATH_TILE:Number = 0;
		private const WATER_TILE:Number = 1;
		private const TALL_GRASS_TILE:Number = 2;
		private const WALL_TILE:Number = 3;
		
		private const wallOffset:Number 			= 11;
		
		private const playAreaColumns:Number 		= 40;
		private const playAreaRows:Number			= 30;
		
		private const bottomRowBound:Number			= playAreaRows + wallOffset;
		private const rightColumnBound:Number		= playAreaColumns + wallOffset;
		
		private const totalAreaColumns:Number 		= playAreaColumns + 2 * wallOffset;
		private const totalAreaRows:Number 			= playAreaRows + 2 * wallOffset;
		
		private const tileWidth:Number				= 16;
		private const tileHeight:Number				= 16;
		
		private const totalAreaWidthPixels:Number	= totalAreaColumns * tileWidth;
		private const totalAreaHeightPixels:Number	= totalAreaRows * tileHeight;
		
		
			
		public function Outside()
		{
			_tiles = new Tilemap(WORLD_TILESET, totalAreaWidthPixels, totalAreaHeightPixels, tileWidth, tileHeight);
			graphic = _tiles;
			layer = 1;
			
			_grid = new Grid(totalAreaWidthPixels, totalAreaHeightPixels, tileWidth, tileHeight);
			mask = _grid;
			
			//set up the main grassland.
			_tiles.setRect(0, 0, totalAreaColumns, totalAreaRows, PATH_TILE);
			
			//set up the perimeter wall.
			_tiles.setRect(0, 0, wallOffset, totalAreaColumns, WALL_TILE);
			_tiles.setRect(0, 0, totalAreaRows, wallOffset, WALL_TILE);
			_tiles.setRect(playAreaColumns + wallOffset, 0, wallOffset, totalAreaColumns, WALL_TILE);
			_tiles.setRect(playAreaColumns + wallOffset, playAreaRows + wallOffset, totalAreaRows + wallOffset, wallOffset, WALL_TILE);
			
			//grid
			_grid.setRect(0, 0, wallOffset, totalAreaColumns, true);
			_grid.setRect(0, 0, totalAreaRows, wallOffset, true);
			_grid.setRect(playAreaColumns + wallOffset, 0, wallOffset, totalAreaColumns, true);
			_grid.setRect(playAreaColumns + wallOffset, playAreaRows + wallOffset, totalAreaRows + wallOffset, wallOffset, true);
			
			
			//set up some dark grass.
			_tiles.setRect(wallOffset, bottomRowBound - 10, 20, 5, TALL_GRASS_TILE);
			
			//the river
			_tiles.setRect(wallOffset, bottomRowBound - 13, 20, 3, WATER_TILE);
			
		}
		
	}
}