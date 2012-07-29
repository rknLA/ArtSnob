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
		
		public var theEnemy:Enemy;
		
		private function initializeEnemy():Enemy
		{
			var enemyIndex:int = FP.rand(enemyTypes.length);
			return new enemyTypes[enemyIndex];
		}
		
		
		private var battleState:String;
		
		
		private function initializeBattleStateMachine():void
		{
			battleState = "enteringBattle";
			
			var callback:Function = function():void {
				
			};
			
			//do entering battle animation with the above callback
		}
		
		private function showPlayerActionSelection():void
		{
			//draw the player selection stuff
			battleState = "playerActionSelect";
			
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
			switch (battleState) {
				case "enteringBattle":
					//don't do anything?  don't listen for keys probably..
					break;
				case "playerActionSelect":
					//check for keystrokes, move the menu screen around appropriately
					var actionSelected:int;
					
					if (actionSelected)	//set actionSelected with keystroke
					{
						//hide menu
						//select enemy attack
						//do battle animation
						battleState = "doingBattle"
					}
					break;
				case "doingBattle":
					break;
				case "victory":
					break;
				case "loss":
					break;
			}
			
			super.update();
		}
		

	}
}