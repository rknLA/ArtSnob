package
{
	import flash.geom.Point;
	
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
		
		public static const MAX_SPEED:Number = 3.0;
		public static const ACCEL:Number = 0.5;
		public static const FRICTION:Number = MAX_SPEED / (MAX_SPEED + ACCEL);
		public static const MIN_SPEED:Number = ACCEL * FRICTION;
		
		private var hSpeed:Number = 100;
		private var vSpeed:Number = 100;
		
		private var speed:Point = new Point(0,0);
		
		
		public function Snob()
		{
			super();
			//x = start.x;
			//y = start.y;
			snobImage.add("stand",[0],0,false);
			snobImage.add("sstand",[6],0,false);
			snobImage.add("bstand",[3],0,false);
			snobImage.add("fwalk",[1,2],5,true);
			snobImage.add("swalk",[7,8],5,true);
			snobImage.add("bwalk",[4,5],5,true);
			snobImage.scale = 1;
			graphic = snobImage;
			setHitbox(16,16);
		}
		
		override public function update():void
		{
			if (Input.check(Key.LEFT))
			{
				snobImage.play("swalk");
				snobImage.flipped = false;
				
				speed.x -= ACCEL;
				
			}
			else if (Input.check(Key.RIGHT))
			{
				snobImage.play("swalk");
				snobImage.flipped = true;
				
				speed.x += ACCEL;
				
			}
			else if (Input.check(Key.DOWN))
			{
				snobImage.play("fwalk");
				snobImage.flipped = false;
				
				speed.y += ACCEL;
			}
			else if (Input.check(Key.UP))
			{
				snobImage.play("bwalk");
				snobImage.flipped = false;
				
				speed.y -= ACCEL;
			}
			else if (Input.released(Key.LEFT))
			{
				snobImage.play("sstand");
				snobImage.flipped = false;
				
				speed.x = 0;
			}
			else if (Input.released(Key.RIGHT))
			{
				snobImage.play("sstand");
				snobImage.flipped = true;
				
				speed.x = 0;
			}
			else if (Input.released(Key.DOWN))
			{
				snobImage.play("stand");
				snobImage.flipped = false;
				
				speed.y = 0;
			}
			else if (Input.released(Key.UP))
			{
				snobImage.play("bstand");
				snobImage.flipped = false;
				
				speed.y = 0;
			}
			
			speed.x *= FRICTION;
			speed.y *= FRICTION;
			
			if (Math.abs(speed.x) < MIN_SPEED)
				speed.x = 0;
			if (Math.abs(speed.y) < MIN_SPEED)
				speed.y = 0;
			
			moveBy(speed.x, speed.y, "solid", true);
			
			x = Math.max(x, 10);
			y = Math.max(y, 10);
			
			FP.camera.x = x - FP.screen.width/2;
			FP.camera.y = y - FP.screen.height/2;
			
			super.update();
		}
	}
}