package
{
	import net.flashpunk.FP;

	public class CritiqueAttack extends BattleSnob
	{
		public function CritiqueAttack()
		{
			super();
		}
		
		override public function playerAttack():Object
		{
			return{
				"damage" : FP.rand(5);
				"text" : "Art Snob used CRITIQUE"
			};
		}
	}
}