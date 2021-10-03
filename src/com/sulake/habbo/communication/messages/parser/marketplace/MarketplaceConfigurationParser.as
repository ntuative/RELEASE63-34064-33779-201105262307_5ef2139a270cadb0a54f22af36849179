package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1463:Boolean;
      
      private var var_2492:int;
      
      private var var_1814:int;
      
      private var var_1813:int;
      
      private var var_2494:int;
      
      private var var_2493:int;
      
      private var var_2491:int;
      
      private var var_2278:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1463;
      }
      
      public function get commission() : int
      {
         return this.var_2492;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1814;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1813;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2493;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2494;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2491;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2278;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1463 = param1.readBoolean();
         this.var_2492 = param1.readInteger();
         this.var_1814 = param1.readInteger();
         this.var_1813 = param1.readInteger();
         this.var_2493 = param1.readInteger();
         this.var_2494 = param1.readInteger();
         this.var_2491 = param1.readInteger();
         this.var_2278 = param1.readInteger();
         return true;
      }
   }
}
