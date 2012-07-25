package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class ArtSnob extends Engine
	{
		public function ArtSnob()
		{
			super(640, 480, 60, false);
			FP.world = new OutsideMap;
		}
	}
}
