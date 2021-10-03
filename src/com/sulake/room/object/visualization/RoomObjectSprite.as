package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_1168:int = 0;
       
      
      private var var_424:BitmapData = null;
      
      private var var_2299:String = "";
      
      private var var_295:Boolean = true;
      
      private var var_2365:String = "";
      
      private var var_2706:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_2038:String;
      
      private var var_1521:Boolean = false;
      
      private var var_1522:Boolean = false;
      
      private var _offset:Point;
      
      private var var_274:int = 0;
      
      private var _height:int = 0;
      
      private var var_1118:Number = 0;
      
      private var var_2364:Boolean = false;
      
      private var var_2840:Boolean = true;
      
      private var var_2363:Boolean = false;
      
      private var _updateID:int = 0;
      
      private var var_2454:int = 0;
      
      private var var_2839:Array = null;
      
      public function RoomObjectSprite()
      {
         this.var_2038 = BlendMode.NORMAL;
         this._offset = new Point(0,0);
         super();
         this.var_2454 = var_1168++;
      }
      
      public function dispose() : void
      {
         this.var_424 = null;
         this.var_274 = 0;
         this._height = 0;
      }
      
      public function get asset() : BitmapData
      {
         return this.var_424;
      }
      
      public function get assetName() : String
      {
         return this.var_2299;
      }
      
      public function get visible() : Boolean
      {
         return this.var_295;
      }
      
      public function get tag() : String
      {
         return this.var_2365;
      }
      
      public function get alpha() : int
      {
         return this.var_2706;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function get blendMode() : String
      {
         return this.var_2038;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1522;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1521;
      }
      
      public function get offsetX() : int
      {
         return this._offset.x;
      }
      
      public function get offsetY() : int
      {
         return this._offset.y;
      }
      
      public function get width() : int
      {
         return this.var_274;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function get relativeDepth() : Number
      {
         return this.var_1118;
      }
      
      public function get varyingDepth() : Boolean
      {
         return this.var_2364;
      }
      
      public function get capturesMouse() : Boolean
      {
         return this.var_2840;
      }
      
      public function get clickHandling() : Boolean
      {
         return this.var_2363;
      }
      
      public function get instanceId() : int
      {
         return this.var_2454;
      }
      
      public function get updateId() : int
      {
         return this._updateID;
      }
      
      public function get filters() : Array
      {
         return this.var_2839;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            this.var_274 = param1.width;
            this._height = param1.height;
         }
         this.var_424 = param1;
         ++this._updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         this.var_2299 = param1;
         ++this._updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.var_295 = param1;
         ++this._updateID;
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2365 = param1;
         ++this._updateID;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         this.var_2706 = param1;
         ++this._updateID;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         this._color = param1;
         ++this._updateID;
      }
      
      public function set blendMode(param1:String) : void
      {
         this.var_2038 = param1;
         ++this._updateID;
      }
      
      public function set filters(param1:Array) : void
      {
         this.var_2839 = param1;
         ++this._updateID;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         this.var_1521 = param1;
         ++this._updateID;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         this.var_1522 = param1;
         ++this._updateID;
      }
      
      public function set offsetX(param1:int) : void
      {
         this._offset.x = param1;
         ++this._updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         this._offset.y = param1;
         ++this._updateID;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         this.var_1118 = param1;
         ++this._updateID;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         this.var_2364 = param1;
         ++this._updateID;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         this.var_2840 = param1;
         ++this._updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         this.var_2363 = param1;
         ++this._updateID;
      }
   }
}
