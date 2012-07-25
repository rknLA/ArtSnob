package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Snob extends Entity
	{
		[Embed(source = 'assets/snobsheet.png')]
		private const SNOB:Class;
		
		private var snobImage:Spritemap = new Spritemap(SNOB,14,16);
		
		private var hSpeed:Number = 100;
		private var vSpeed:Number = 100;
		
		
		public function Snob()
		{
			super();
			snobImage.add("stand",[0],0,false);
			snobImage.add("sstand",[6],0,false);
			snobImage.add("bstand",[3],0,false);
			snobImage.add("fwalk",[1,2],5,true);
			snobImage.add("swalk",[7,8],5,true);
			snobImage.add("bwalk",[4,5],5,true);
			//snobImage.scale = 2;
			graphic = snobImage;
		}
		
		override public function update():void
		{
			if (Input.check(Key.LEFT))
			{
				snobImage.play("swalk");
				snobImage.flipped = false;
				
				x -= hSpeed * FP.elapsed;
				
			}
			else if (Input.check(Key.RIGHT))
			{
				snobImage.play("swalk");
				snobImage.flipped = true;
				
				x += hSpeed * FP.elapsed;
				
			}
			else if (Input.check(Key.DOWN))
			{
				snobImage.play("fwalk");
				snobImage.flipped = false;
				
				y += vSpeed * FP.elapsed;
			}
			else if (Input.check(Key.UP))
			{
				snobImage.play("bwalk");
				snobImage.flipped = false;
				
				y -= vSpeed * FP.elapsed;
			}
			else if (Input.released(Key.LEFT))
			{
				snobImage.play("sstand");
				snobImage.flipped = false;
				
				x += 0;
			}
			else if (Input.released(Key.RIGHT))
			{
				snobImage.play("sstand");
				snobImage.flipped = true;
				
				x += 0;
			}
			else if (Input.released(Key.DOWN))
			{
				snobImage.play("stand");
				snobImage.flipped = false;
				
				y += 0;
			}
			else if (Input.released(Key.UP))
			{
				snobImage.play("bstand");
				snobImage.flipped = false;
				
				y += 0;
			}
			
			super.update();
		}
	}
}