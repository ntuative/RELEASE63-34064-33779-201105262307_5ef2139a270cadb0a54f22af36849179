package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_787:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_2365:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_787);
         this.var_2365 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2365;
      }
   }
}
