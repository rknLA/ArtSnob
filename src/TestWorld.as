package
{
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Backdrop;
	
	public class TestWorld extends World
	{
		[Embed(source = 'assets/grass.png')]
		private const GRASS:Class;
		
		private var backdrop:Backdrop = new Backdrop(GRASS,true,true);
		
		public function TestWorld()
		{
			super();
			add(new Snob);
			addGraphic(backdrop,10,0,0);
			
		}
		
		override public function update():void
		{
			
			super.update();
		}
	}
}