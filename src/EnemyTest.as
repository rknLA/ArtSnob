package
{
	import net.flashpunk.graphics.Image;

	public class EnemyTest extends Enemy
	{
		private var enemyImage:Image = Image.createRect(32,40,0x00FF00);
		
		public function EnemyTest()
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
	}
}