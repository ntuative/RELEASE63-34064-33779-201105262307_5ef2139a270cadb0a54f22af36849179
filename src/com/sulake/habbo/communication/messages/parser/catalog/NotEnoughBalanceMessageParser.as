package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1930:int = 0;
      
      private var var_1931:int = 0;
      
      private var var_1687:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1930;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1931;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1687;
      }
      
      public function flush() : Boolean
      {
         this.var_1930 = 0;
         this.var_1931 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1930 = param1.readInteger();
         this.var_1931 = param1.readInteger();
         this.var_1687 = param1.readInteger();
         return true;
      }
   }
}
