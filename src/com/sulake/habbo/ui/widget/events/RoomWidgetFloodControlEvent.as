package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetFloodControlEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_861:String = "RWFCE_FLOOD_CONTROL";
       
      
      private var var_1993:int = 0;
      
      public function RoomWidgetFloodControlEvent(param1:int)
      {
         super(const_861,false,false);
         this.var_1993 = param1;
      }
      
      public function get seconds() : int
      {
         return this.var_1993;
      }
   }
}
