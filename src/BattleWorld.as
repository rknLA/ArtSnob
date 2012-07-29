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
				showPlayerActionSelection();
			};
			
			//do entering battle animation with the above callback
		}
		
		private function showPlayerActionSelection():void
		{
			//draw the player selection stuff
			battleState = "playerActionSelect";

		}
		
		private function finalizePlayerActionSelection(/*with action? */):void
		{
			var enemyResults:Object = theEnemy.enemyAttack();
			
			//subtract enemyResults.damage, display enemyResults.text, etc.
			
			// battlesnob.attack
			
			battleState = "doingBattle";
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
			initializeBattleStateMachine();
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
						finalizePlayerActionSelection(/*with action? */);
					}
					break;
				case "doingBattle":
					//do battle animation,
					// this might not be necessary if the animation is done in finalizePlayerActionSelection with a callback that checks for victory or defeat.
					break;
				case "victory":
					//display a victory message and listen for enter?
					break;
				case "loss":
					break;
			}
			
			super.update();
		}
		

	}
}