package org.papervision3d.objects.lights
{
	import flash.display.BitmapData;
	import flash.display.GradientType;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	
	import org.papervision3d.objects.DisplayObject3D;
	
	public class PointLight extends DisplayObject3D implements ILight
	{
		protected var ambientColor:uint = 0x101010;
		protected var lightColor:uint = 0xFFFFFF;
		public function PointLight(lightColor:uint=0xAAAAAA, ambientColor:uint=0x000000)
		{
			this.ambientColor = ambientColor;
			this.lightColor = lightColor;	
		}

		private var flatMap : BitmapData = new BitmapData(256, 1, false, 0);
		private var flatMapCreated :Boolean = false;
		public function getFlatMap():BitmapData{
			
			if(!flatMapCreated){
				var s:Sprite = new Sprite();
				var m:Matrix = new Matrix();
				m.createGradientBox(256,1,0,0,0);
				s.graphics.beginGradientFill(GradientType.LINEAR, [ambientColor,lightColor],[1,1],[0,255],m);
				s.graphics.drawRect(0,0,256,1);
				s.graphics.endFill();
				flatMap.draw(s);
				flatMapCreated = true;
			}
			return flatMap;
		}
	}
}