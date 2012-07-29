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
		}
		
		override public function enemyAttack():Object
		{
			//specific attack for blue enemy
			//do random stuff here to determine damage, text, etc
		
			var results:Object = {
				"damage": 0,
				"text": "The Blue enemy attacked!"
			};	
			
			return results;
		}
	}
}