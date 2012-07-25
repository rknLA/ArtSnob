package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class Grass extends Entity
	{
		[Embed(source = 'assets/grass.png')]
		private const GRASS:Class;
		
		private var grassImage:Image = new Image(GRASS);
		
		public function Grass()
		{
			super();
			graphic = grassImage;
			type = "grass";
			layer = 1;
			
			setHitbox(16, 16);
		}
	}
}