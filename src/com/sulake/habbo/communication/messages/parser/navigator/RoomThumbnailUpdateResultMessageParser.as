package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomThumbnailUpdateResultMessageParser implements IMessageParser
   {
       
      
      private var var_384:int;
      
      private var var_1783:int;
      
      public function RoomThumbnailUpdateResultMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_384 = param1.readInteger();
         this.var_1783 = param1.readInteger();
         return true;
      }
      
      public function get flatId() : int
      {
         return this.var_384;
      }
      
      public function get resultCode() : int
      {
         return this.var_1783;
      }
   }
}
