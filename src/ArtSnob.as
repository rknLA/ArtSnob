package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	[SWF(width="640",height="480",frameRate="60")]
	
	public class ArtSnob extends Engine
	{
		
		public function ArtSnob()
		{
			super(320,240,60,false);
			FP.world = new TestWorld;
			FP.screen.scale = 2;
		}
	}
}