package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.tweens.misc.VarTween;
	
	public class Enemy extends Entity
	{
		public var hp:int;
		public var maxHp:int;
		public var attack:int;
		public var defense:int;
		public var pp:int;
		public var xp:int;
		public var value:int;
		
		public function Enemy()
		{
			super();
			this.visible = true;
			type = "enemy";
		}
		
		//returns the amount of damage to the player
		public function enemyAttack():Object
		{	
			return {
				"damage": 0,
				"text": "A generic enemy attacked!",
				"name": "name"
			};	
		}
		
		
		public function battleStart():void
		{
			if (BattleWorld.battleState == "enteringBattle")
			{
				BattleWorld.battleState = "playerActionSelect";
			}
		}
		
		override public function added():void
		{	
			var enemyTween:VarTween = new VarTween(battleStart);
			enemyTween.tween(this,"x",250,1);
			addTween(enemyTween);
		}
	}
}