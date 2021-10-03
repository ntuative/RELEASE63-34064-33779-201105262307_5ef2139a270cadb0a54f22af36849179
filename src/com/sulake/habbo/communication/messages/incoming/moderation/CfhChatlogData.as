package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1950:int;
      
      private var var_2702:int;
      
      private var var_1381:int;
      
      private var var_2197:int;
      
      private var var_114:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1950 = param1.readInteger();
         this.var_2702 = param1.readInteger();
         this.var_1381 = param1.readInteger();
         this.var_2197 = param1.readInteger();
         this.var_114 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1950);
      }
      
      public function get callId() : int
      {
         return this.var_1950;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2702;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1381;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2197;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_114;
      }
   }
}
