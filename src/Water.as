package
{
	import net.flashpunk.Entity;
	
	public class Water extends Entity
	{
		[Embed(source = 'assets/WATER.png')]
		private const WATER:Class;
		
		private var waterImage:Image = new Image(WATER);
		
		public function Water()
		{
			super();
			
			graphic = waterImage;
			type = "water";
			layer = -100;
			
			setHitbox(16, 16);
		}
	}
}