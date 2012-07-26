package
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.VarTween;
	
	public class BattleWorld extends World
	{
		[Embed(source = 'assets/snobbattle.png')]
		private const BATTLESNOB:Class;
		
		[Embed(source = 'assets/curator.png')]
		private const CURATOR:Class;
		
		private var battlePlayer:Entity;
		private var battleEnemy:Entity;
		
		private var playerImage:Image = new Image(BATTLESNOB);
		private var curatorImage:Image = new Image(CURATOR);
		
		public function BattleWorld()
		{
			super();
			playerImage.scale = 2;
			battlePlayer = new Entity(400,150,playerImage);
			battleEnemy = new Entity(-50,25,curatorImage);
			add(battlePlayer);
			add(battleEnemy);
		}
		
		override public function begin():void
		{
			
			var playerTween:VarTween = new VarTween();
			playerTween.tween(battlePlayer,"x",25,1);
			addTween(playerTween);
			
			var enemyTween:VarTween = new VarTween();
			enemyTween.tween(battleEnemy,"x",250,1);
			addTween(enemyTween);
			
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}