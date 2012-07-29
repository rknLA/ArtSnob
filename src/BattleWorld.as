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
		
		//private var battleEnemy:Entity;
		
		private const enemyTypes:Array = [
			GreenEnemy,
			BlueEnemy
		];
		
		private var snobTurn:Boolean;
		
		public static var snobSelect:String;
		private var eSelect:String;
		
		private var battleArray:Array = [];
		
		public static var currentEnemy:Enemy;
		
		private function initializeEnemy():Enemy
		{
			var enemyIndex:int = FP.rand(enemyTypes.length);
			
			return new enemyTypes[enemyIndex];
		}
		
		public function BattleWorld()
		{
			super();
			//battleEnemy = new Entity(-50,25,curatorImage);
			add(new BattleSnob);
			//add(battleEnemy);
			
			var theEnemy:Enemy = initializeEnemy();
			trace(theEnemy);
			add(theEnemy);
			
			add(new BattleMenu);
			
			
		}
		
		override public function begin():void
		{
			
		}
		
		override public function update():void
		{
			//currentEnemy.hp -= BattleSnob.attack - currentEnemy.defense;
			
			trace(currentEnemy.hp);
			
			super.update();
		}
		
		public function myTurn():void
		{
			switch(snobSelect)
			{
				case "attack":	
					break;
				case "outsmart":
					break;
				case "heal":
					break;
				case "painting":
					break;
				case "run":
					break;
			}
		}
		
		public function eTurn():void
		{
			switch(eSelect)
			{
				case "attack":
					break;
				case "special":
					break;
				case "heal":
					break;
				case "run":
					break;
			}
		}
	}
}