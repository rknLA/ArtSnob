package
{	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class BattleMenu extends Entity
	{
		[Embed(source = 'assets/menububble.png')]
		private const MENU:Class;
		
		[Embed(source = 'assets/cursor.png')]
		private const CURSOR:Class;
		
		private var menuOn:Boolean = false;
		private var menuChoose:int = 0;
		private var menuSwitch:String = "main";
		private var menuTimer:Number = 0;
		public static var menuSelect:String;
		
		private var menuBubble:Image = new Image(MENU);
		private var dText:Text = new Text(String(blank),5,180);
		private var fightText:Text = new Text("FIGHT",150,180);
		private var itemText:Text = new Text("ITEM",150,200);
		private var pText:Text = new Text("PTNG",250,180);
		private var runText:Text = new Text("RUN",250,200);
		private var cursor:Image = new Image(CURSOR);
		
		private var move1Text:Text = new Text(String(move1),25,180);
		private var move2Text:Text = new Text(String(move2),25,195);
		private var move3Text:Text = new Text(String(move3),25,210);
		
		private var move1:Object;
		private var move2:Object;
		private var move3:Object;
		
		public static var blank:String = "TEST!";
		
		private var battleList:Graphiclist = new Graphiclist(dText);
		private var menuList:Graphiclist = new Graphiclist(fightText, itemText, pText, runText, cursor);
		private var movesList:Graphiclist = new Graphiclist(move1Text, move2Text, move3Text, cursor);
		
		public function BattleMenu()
		{
			super();
			
			menuBubble.scale = 3;
			menuBubble.y = 170;
			cursor.x = 140;
			cursor.y = 185;
			graphic = battleList;
			
			move1 = BattleSnob.MOVES_LIST[0];
			move2 = BattleSnob.MOVES_LIST[1];
			move3 = BattleSnob.MOVES_LIST[2];
			
			move1Text.text = (String(move1['name']));
			move2Text.text = (String(move2['name']));
			move3Text.text = (String(move3['name']));
			
		}
		
		
		override public function update():void
		{
			dText.text = String(blank);
			
			if (BattleWorld.battleState == "playerActionSelect")
			{
				menuOn = true;
			}
			else if (BattleWorld.battleState == "doingBattle")
			{
				menuOn = false;
			}
			
			if (menuOn == true)
			{
				if (Input.pressed(Key.DOWN))
				{
					menuChoose += 1;
				}
				else if (Input.pressed(Key.UP))
				{
					menuChoose -= 1;
				}
				
				if (menuSwitch == "main")
				{
					this.graphic = menuList;
					
					if (menuChoose == 0)
					{
						cursor.x = 140;
						cursor.y = 185;
						menuSelect = "attack";
					}
					else if (menuChoose == 1)
					{
						cursor.x = 140;
						cursor.y = 205;
						menuSelect = "item";
					}
					else if (menuChoose == 2)
					{
						cursor.x = 240;
						cursor.y = 185;
						menuSelect = "painting";
					}
					else if (menuChoose == 3)
					{
						cursor.x = 240;
						cursor.y = 205;
						menuSelect = "run";
					}
					
					if (menuChoose > 3)
					{
						menuChoose = 3;
					}
					else if (menuChoose < 0)
					{
						menuChoose = 0;
					}
					
					if (Input.pressed(Key.SPACE))
					{
						if (menuSelect == "attack")
						{
							menuSwitch = "attack";
						}
						else if (menuSelect == "item")
						{
							menuSwitch = "item";
						}
						else if (menuSelect == "painting")
						{
							menuSwitch = "painting";
						}
						else if (menuSelect == "run")
						{
							menuSwitch = "run";
						}
					}
				}
				else if (menuSwitch == "attack")
				{
					this.graphic = movesList;
					
					if (menuChoose == 0)
					{
						cursor.x = 20;
						cursor.y = 185;
						menuSelect = "move1";
					}
					else if (menuChoose == 1)
					{
						cursor.x = 20;
						cursor.y = 200;
						menuSelect = "move2";
					}
					else if (menuChoose == 2)
					{
						cursor.x = 20;
						cursor.y = 215;
						menuSelect = "move3";
					}
					
					if (menuChoose > 2)
					{
						menuChoose = 2;
					}
					else if (menuChoose < 0)
					{
						menuChoose = 0;
					}
					
					if (Input.pressed(Key.SPACE))
					{
						if (menuSelect == "move1")
						{
							BattleSnob.MOVE_SELECT = BattleSnob.MOVES_LIST[0];
							menuSelect = "turnComplete";
						}
						else if (menuSelect == "move2")
						{	
							BattleSnob.MOVE_SELECT = BattleSnob.MOVES_LIST[1];
							menuSelect = "turnComplete";
						}
						else if (menuSelect == "move3")
						{	
							BattleSnob.MOVE_SELECT = BattleSnob.MOVES_LIST[2];
							menuSelect = "turnComplete";
						}
					}
				}
				
			}
			else if (menuOn == false)
			{
				menuTimer += FP.elapsed;
				if (menuTimer > 1)
				{
					this.graphic = battleList;
				}
				
			}
			
			super.update();
		}
	}
}