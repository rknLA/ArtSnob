package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class BattleWorld extends World
	{

		private const enemyTypes:Array = [
			GreenEnemy,
			BlueEnemy
		];
		
		private var battleArray:Array = [];
		
		public static var theEnemy:Enemy;
		
		
		private function initializeEnemy():Enemy
		{
			var enemyIndex:int = FP.rand(enemyTypes.length);
			
			return new enemyTypes[enemyIndex];
		}
		
		public function BattleWorld()
		{
			super();
			add(new BattleSnob);
			
			theEnemy = initializeEnemy();
			
			add(theEnemy);
			
			add(new BattleMenu);
			
			
		}
		
		override public function begin():void
		{
			
		}
		
		override public function update():void
		{
			//currentEnemy.hp -= BattleSnob.attack - currentEnemy.defense;
			
			trace(theEnemy.hp);
			
			super.update();
		}
		

	}
}