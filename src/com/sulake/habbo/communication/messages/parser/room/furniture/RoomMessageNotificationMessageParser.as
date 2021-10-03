package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomMessageNotificationMessageParser implements IMessageParser
   {
       
      
      private var _roomId:int;
      
      private var var_955:String;
      
      private var var_1125:int;
      
      public function RoomMessageNotificationMessageParser()
      {
         super();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomName() : String
      {
         return this.var_955;
      }
      
      public function get messageCount() : int
      {
         return this.var_1125;
      }
      
      public function flush() : Boolean
      {
         this._roomId = -1;
         this.var_955 = "";
         this.var_1125 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_955 = param1.readString();
         this.var_1125 = param1.readInteger();
         return true;
      }
   }
}
