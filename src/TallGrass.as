package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class TallGrass extends Entity
	{
		[Embed(source = 'assets/tallgrass.png')]
		private const TALLGRASS:Class;
		
		private var tallGrassImage:Image = new Image(TALLGRASS);
		
		public function TallGrass()
		{
			super();
			graphic = tallGrassImage;
			type = "tallgrass";
			setHitbox(16,16);
			
		}
	}
}