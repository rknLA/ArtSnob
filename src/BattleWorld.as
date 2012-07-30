package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
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
		public var theSnob:BattleSnob;
		
		private var snobHP:Entity;
		private var eHP:Entity;
		private var snobHPText:Text;
		private var eHPText:Text;
		
		private function initializeEnemy():Enemy
		{
			var enemyIndex:int = FP.rand(enemyTypes.length);
			return new enemyTypes[enemyIndex];
		}
		
		
		public static var battleState:String;
		private var battleTimer:Number = 0;
		
		
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
			
			theSnob.hp -= enemyResults["damage"];
			
			//subtract enemyResults.damage, display enemyResults.text, etc.
			
			// battlesnob.attack
			var playerResults:Object = theSnob.playerAttack();
			
			theEnemy.hp -= playerResults['damage'];
			
			battleState = "doingBattle";
		}
		
		private function battlePlay():void
		{
			var enemyText:Object = theEnemy.enemyAttack();
			var playerText:Object = theSnob.playerAttack();
			
			BattleMenu.blank = enemyText["text"];
			battleTimer += FP.elapsed;
			if (battleTimer > 1)
			{
				FP.camera.x += FP.choose(-FP.random,FP.random);
			}
			if (battleTimer > 2)
			{
				FP.camera.x = 0;
				snobHPText.text = (String("Art Snob: " + theSnob.hp));
			}
			if (battleTimer > 3)
			{
				BattleMenu.blank = playerText["text"];
			}
			if (battleTimer > 4)
			{
				theEnemy.x += FP.choose(-FP.random,FP.random);
			}
			if (battleTimer > 5)
			{
				theEnemy.x = 250;
				eHPText.text = ("Enemy: " + String(theEnemy.hp));
			}
			if (battleTimer > 6)
			{
				if (theSnob.hp <= 0)
				{
					battleState = "loss";
				}
				else if (theEnemy.hp <= 0)
				{
					battleState = "victory";
					theSnob.xp += theEnemy.xp;
				}
				else
				{
					battleState = "playerActionSelect";
				}
				
				battleTimer = 0;
			}
		}
		
		public function victoryPlay():void
		{
			
			var enemyLoseText:Object = theEnemy.enemyAttack();
			
			BattleMenu.blank = String(enemyLoseText["name"] + " has fainted!");
			
			battleTimer += FP.elapsed;
			if (battleTimer > 1)
			{
				theEnemy.visible = false;
			}
			if (battleTimer > 2)
			{
				BattleMenu.blank = String("Art Snob gained " + theEnemy.xp + " XP!");
			}
			if (battleTimer > 4)
			{
				if (theSnob.level > theSnob.currentLevel)
				{
					BattleMenu.blank = String("Art Snob reached level " + theSnob.level + "!");
				}
			}
			if (battleTimer > 5)
			{
				FP.world = new TestWorld;
			}
		}
		
		
		
		public function BattleWorld()
		{
			super();
			theSnob = new BattleSnob;
			add(theSnob);
			
			theEnemy = initializeEnemy();
			
			add(theEnemy);
			
			add(new BattleMenu);
			
			snobHPText = new Text(String("Art Snob: "+theSnob.hp));
			eHPText = new Text("Enemy: "+String(theEnemy.hp));
			snobHP = new Entity(0,0,snobHPText);
			eHP = new Entity(0,20,eHPText);
			
			add(snobHP);
			add(eHP);
			
			
		}
		
		override public function begin():void
		{
			initializeBattleStateMachine();
		}
		
		override public function update():void
		{
			trace(theSnob.xp);
			
			switch (battleState) {
				case "enteringBattle":
					//don't do anything?  don't listen for keys probably..
					
					break;
				case "playerActionSelect":
					//check for keystrokes, move the menu screen around appropriately
					
					var actionSelected:int;
					
					if (BattleMenu.menuSelect == "turnComplete")	//set actionSelected with keystroke
					{
						
						//hide menu
						//select enemy attack
						//do battle animation
						
						finalizePlayerActionSelection(/*with action? */);
					}
					break;
				case "doingBattle":
					battlePlay();
					//do battle animation,
					// this might not be necessary if the animation is done in finalizePlayerActionSelection with a callback that checks for victory or defeat.
					break;
				case "victory":
					victoryPlay();
					//display a victory message and listen for enter?
					break;
				case "loss":
					break;
			}
			
			super.update();
		}
		
	}
}