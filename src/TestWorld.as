package
{
	import flash.geom.Point;
	
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Tilemap;
	
	public class TestWorld extends World
	{
		[Embed(source = 'assets/grass.png')]
		private const GRASS:Class;
		
		private var backdrop:Backdrop = new Backdrop(GRASS,true,true);
		
		public function TestWorld()
		{
			super();
			var startingPoint:Point = new Point(10, 440);
			add(new Snob(startingPoint));
			//addGraphic(backdrop,10,0,0);
			add(new Outside);

		}
		
		override public function update():void
		{
			
			super.update();
		}
	}
}