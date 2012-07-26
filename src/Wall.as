package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class Wall extends Entity
	{
		[Embed(source = 'assets/wall.png')]
		private const WALL:Class;
		
		private var wallImage:Image = new Image(WALL);
		
		public function Wall()
		{
			super();
			graphic = wallImage;
			type = "solid";
			setHitbox(16,16);
		}
		
	}
}