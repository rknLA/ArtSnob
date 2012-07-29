package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	
	public class BattleMenu extends Entity
	{
		[Embed(source = 'assets/menububble.png')]
		private const MENU:Class;
		
		private var menuBubble:Image = new Image(MENU);
		
		private var battleList:Graphiclist = new Graphiclist(menuBubble);
		
		public function BattleMenu()
		{
			super();
			
			menuBubble.scale = 3;
			menuBubble.y = 170;
			graphic = battleList;
			
		}
	}
}