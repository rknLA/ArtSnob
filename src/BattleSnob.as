package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.VarTween;
	
	public class BattleSnob extends Entity
	{
		[Embed(source = 'assets/snobbattle.png')]
		private const BATTLESNOB:Class;
		
		private var playerImage:Image = new Image(BATTLESNOB);
		
		public static var hp:int = 25;
		public static var maxHp:int = 25;
		public static var sp:int = 5;
		public static var defense:int = 5;
		public static var attack:int = 5;
		public static var xp:int = 0;
		public static var level:int = 1;
		
		public function BattleSnob()
		{
			super();
			x = 400;
			y = 115;
			playerImage.scale = 2;
			graphic = playerImage;
		}
		
		override public function added():void
		{
			var playerTween:VarTween = new VarTween();
			playerTween.tween(this,"x",25,1);
			addTween(playerTween);
		}
	}
}