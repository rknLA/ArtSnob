package
{
	import net.flashpunk.graphics.Image;
	
	public class BlueEnemy extends Enemy
	{
		private var enemyImage:Image = Image.createRect(32,40,0x0000FF);
		
		public function BlueEnemy()
		{
			super();
			graphic = enemyImage;
			hp = 10;
			maxHp = 10;
			attack = 2;
			defense = 2;
			pp = 2;
			xp = 5;
			value = 10;
			
			BattleWorld.currentEnemy = this;
		}
		
		override public function enemyAttack():int
		{
			//specific attack for blue enemy
			return 0;
		}
	}
}