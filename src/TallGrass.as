package
{
	import net.flashpunk.Entity;
	
	public class TallGrass extends Entity
	{
		[Embed(source = 'assets/tall_grass.png')]
		private const TALL_GRASS:Class;
		
		private var tallGrassImage:Image = new Image(TALL_GRASS);
		
		public function TallGrass()
		{
			super();
			
			graphic = tallGrassImage;
			type = "tallGrass";
			layer = -1;
			
			setHitbox(16, 16);
		}
	}
}