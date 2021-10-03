package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_161:String = "ROE_MOUSE_CLICK";
      
      public static const const_179:String = "ROE_MOUSE_ENTER";
      
      public static const const_612:String = "ROE_MOUSE_MOVE";
      
      public static const const_183:String = "ROE_MOUSE_LEAVE";
      
      public static const const_2157:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_570:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1880:String = "";
      
      private var var_2374:Boolean;
      
      private var var_2373:Boolean;
      
      private var var_2375:Boolean;
      
      private var var_2370:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1880 = param2;
         this.var_2374 = param5;
         this.var_2373 = param6;
         this.var_2375 = param7;
         this.var_2370 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1880;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2374;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2373;
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
