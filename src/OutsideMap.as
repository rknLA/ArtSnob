package
{
	import flash.geom.Point;
	
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Tilemap;
	
	public class OutsideMap extends World
	{
		FP.screen.color = 0xCCCCCC;
		
		private var _tiles:Tilemap;
		
		override public function begin():void
		{
			var playerStart:Point = new Point(FP.screen.width / 2, FP.screen.height / 2);
			add(new Player(playerStart));
			
			super.begin();
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}
}