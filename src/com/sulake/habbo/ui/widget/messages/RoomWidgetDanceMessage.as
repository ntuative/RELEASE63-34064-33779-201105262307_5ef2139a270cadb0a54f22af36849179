package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDanceMessage extends RoomWidgetMessage
   {
      
      public static const const_752:String = "RWCM_MESSAGE_DANCE";
      
      public static const const_1174:int = 0;
      
      public static const const_1915:Array = [2,3,4];
       
      
      private var var_83:int = 0;
      
      public function RoomWidgetDanceMessage(param1:int)
      {
         super(const_752);
         this.var_83 = param1;
      }
      
      public function get style() : int
      {
         return this.var_83;
      }
   }
}
