package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_135:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1685:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_135);
         this.var_1685 = param1;
      }
      
      public function get vote() : int
      {
         return this.var_1685;
      }
   }
}
