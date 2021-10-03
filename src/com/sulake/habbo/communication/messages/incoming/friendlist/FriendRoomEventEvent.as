package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.friendlist.FriendRoomEventMessageParser;
   
   public class FriendRoomEventEvent extends MessageEvent implements IMessageEvent
   {
       
      
      public function FriendRoomEventEvent(param1:Function)
      {
         super(param1,FriendRoomEventMessageParser);
      }
      
      public function getParser() : FriendRoomEventMessageParser
      {
         return var_10 as FriendRoomEventMessageParser;
      }
   }
}
