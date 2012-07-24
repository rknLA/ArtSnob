package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public class InventoryAndThwart extends Engine
	{
		public function InventoryAndThwart()
		{
			super(640, 480, 60, false);
			FP.world = new Level1;
		}
	}
}
