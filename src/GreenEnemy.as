package
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	public class GreenEnemy extends Enemy
	{
		private var enemyImage:Image = Image.createRect(32,40,0x00FF00);
		
		public function GreenEnemy()
		{
			super();
			graphic = enemyImage;
			hp = 10;
			maxHp = 10;
			attack = 2;
			defense = 2;
			pp = 2;
			xp = 10;
			value = 10;
			
			BattleMenu.blank = "A Wild Green Dude Has Appeared!";
		}
		
		override public function enemyAttack():Object
		{
			return {
				"damage": FP.rand(10),
				"text" : "The Green Enemy attacked!",
				"name" : "Green Enemy"
				
			};	
			
		}
	}
}