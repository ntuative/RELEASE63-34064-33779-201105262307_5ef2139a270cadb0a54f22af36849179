package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1880:String = "";
      
      private var var_1760:String = "";
      
      private var var_2369:String = "";
      
      private var var_2371:Number = 0;
      
      private var var_2372:Number = 0;
      
      private var var_2229:Number = 0;
      
      private var var_2233:Number = 0;
      
      private var var_2373:Boolean = false;
      
      private var var_2374:Boolean = false;
      
      private var var_2375:Boolean = false;
      
      private var var_2370:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1880 = param2;
         this.var_1760 = param3;
         this.var_2369 = param4;
         this.var_2371 = param5;
         this.var_2372 = param6;
         this.var_2229 = param7;
         this.var_2233 = param8;
         this.var_2373 = param9;
         this.var_2374 = param10;
         this.var_2375 = param11;
         this.var_2370 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1880;
      }
      
      public function get canvasId() : String
      {
         return this.var_1760;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2369;
      }
      
      public function get screenX() : Number
      {
         return this.var_2371;
      }
      
      public function get screenY() : Number
      {
         return this.var_2372;
      }
      
      public function get localX() : Number
      {
         return this.var_2229;
      }
      
      public function get localY() : Number
      {
         return this.var_2233;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2373;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2374;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2375;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2370;
      }
   }
}
