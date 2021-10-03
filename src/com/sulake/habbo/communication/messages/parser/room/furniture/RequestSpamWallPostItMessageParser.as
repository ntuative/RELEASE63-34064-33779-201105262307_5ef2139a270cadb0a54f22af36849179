package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RequestSpamWallPostItMessageParser implements IMessageParser
   {
       
      
      private var var_2074:int;
      
      private var var_416:String;
      
      public function RequestSpamWallPostItMessageParser()
      {
         super();
      }
      
      public function get itemId() : int
      {
         return this.var_2074;
      }
      
      public function get location() : String
      {
         return this.var_416;
      }
      
      public function flush() : Boolean
      {
         this.var_2074 = -1;
         this.var_416 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_2074 = param1.readInteger();
         this.var_416 = param1.readString();
         return true;
      }
   }
}
