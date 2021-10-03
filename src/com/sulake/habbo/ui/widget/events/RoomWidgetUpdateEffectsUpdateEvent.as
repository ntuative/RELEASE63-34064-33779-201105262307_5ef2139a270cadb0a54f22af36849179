package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetUpdateEffectsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_984:String = "RWUEUE_UPDATE_EFFECTS";
       
      
      private var var_275:Array;
      
      public function RoomWidgetUpdateEffectsUpdateEvent(param1:Array = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_984,param2,param3);
         this.var_275 = param1;
      }
      
      public function get effects() : Array
      {
         return this.var_275;
      }
   }
}
