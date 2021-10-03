package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarExperienceUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2458:int;
      
      public function RoomObjectAvatarExperienceUpdateMessage(param1:int)
      {
         super();
         this.var_2458 = param1;
      }
      
      public function get gainedExperience() : int
      {
         return this.var_2458;
      }
   }
}
