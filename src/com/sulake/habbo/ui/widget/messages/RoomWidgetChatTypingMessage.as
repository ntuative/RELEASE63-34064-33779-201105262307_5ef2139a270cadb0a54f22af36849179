package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_926:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_586:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_926);
         this.var_586 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_586;
      }
   }
}
