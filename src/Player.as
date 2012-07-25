package
{
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Player extends Entity
	{
		private var sprite:Image;
		
		private var playerSpeed:Number = 100 * FP.elapsed;
		
		private var _v:Point;
		
		public function Player(p:Point)
		{
			super();
			sprite = Image.createRect(16,16, 0xFF0000);
			setHitbox(16,16);
			type = "Player";
			graphic = sprite;
			x = p.x;
			y = p.y;
			_v = new Point;
		}
		
		override public function update():void
		{
			updateMovement();
			updateCollision();
			super.update();
		}
		
		private function updateMovement():void
		{
			var movement:Point = new Point;
			
			if (Input.check(Key.LEFT)) movement.x--;
			if (Input.check(Key.RIGHT)) movement.x++;
			if (Input.check(Key.UP)) movement.y--;
			if (Input.check(Key.DOWN)) movement.y++;
			
			_v.x = movement.x * playerSpeed;
			_v.y = movement.y * playerSpeed;
			
		}
		
		private function updateCollision():void
		{
			/*
			var newLocation:Point = new Point;
			newLocation.x = _v.x + x;
			newLocation.y = _v.y _ y;
			*/
			trace(_v);
			
			x += _v.x;
			y += _v.y;
			
			/*
			if (newLocation.x < 0) x = 0;
			if (x + this.width > FP.screen.width) x = FP.screen.width - this.width;
			if (y < 0) y = 0;
			if (y + this.height > FP.screen.height) y = FP.screen.height - this.height; 
			*/
		}
	}
}