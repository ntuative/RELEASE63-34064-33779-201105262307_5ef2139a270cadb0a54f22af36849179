package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarDanceUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1619:int;
      
      public function RoomObjectAvatarDanceUpdateMessage(param1:int = 0)
      {
         super();
         this.var_1619 = param1;
      }
      
      public function get danceStyle() : int
      {
         return this.var_1619;
      }
   }
}
