package
{
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.VarTween;
	
	public class BattleSnob extends Entity
	{
		[Embed(source = 'assets/snobbattle.png')]
		private const BATTLESNOB:Class;
		
		private var playerImage:Image = new Image(BATTLESNOB);
		
		//public static const MOVES_LIST:Array = ["CRITIQUE", "OUTSMART","FLASH PHOTO"];
		
		public static const MOVES_LIST:Array = [
			{
				"name": "CRITIQUE",
				"damage": 5
			},
			{
				"name": "OUTSMART",
				"damage": 3
			},
			{
				"name": "FLASH PHOTO",
				"damage": 10
			},
		];
		
		public static var MOVE_SELECT:Object = {
			"damage" : 0,
			"name" : "name"
		};
		
		public var hp:int = 25;
		public var maxHp:int = 25;
		public var sp:int = 5;
		public var defense:int = 5;
		public var attack:int = 5;
		public var xp:int = 0;
		public var level:int = 1;
		public var levelCap:int = level * 5;
		
		public var currentLevel:int;
		
		public function BattleSnob()
		{
			super();
			x = 400;
			y = 115;
			currentLevel = level;
			playerImage.scale = 2;
			graphic = playerImage;
		}
		
		override public function added():void
		{
			var playerTween:VarTween = new VarTween();
			playerTween.tween(this,"x",25,1);
			addTween(playerTween);
		}
		
		override public function update():void
		{
			if (xp > levelCap)
			{
				level += 1;
				xp = 0;
			}
			
			super.update();
		}
		
		public function playerAttack():Object
		{
			
			return{
				"damage" : MOVE_SELECT['damage'],
				"text" : String("Art Snob used " + MOVE_SELECT['name'])
			};

		}
		
		
	}
}