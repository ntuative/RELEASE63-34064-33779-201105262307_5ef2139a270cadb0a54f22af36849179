package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2268:int;
      
      private var var_2265:int;
      
      private var var_2267:int;
      
      private var _dayOffsets:Array;
      
      private var var_2022:Array;
      
      private var var_2021:Array;
      
      private var var_2269:int;
      
      private var var_2266:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2268;
      }
      
      public function get offerCount() : int
      {
         return this.var_2265;
      }
      
      public function get historyLength() : int
      {
         return this.var_2267;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_2022;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_2021;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2269;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2266;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2268 = param1.readInteger();
         this.var_2265 = param1.readInteger();
         this.var_2267 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_2022 = [];
         this.var_2021 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_2022.push(param1.readInteger());
            this.var_2021.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2266 = param1.readInteger();
         this.var_2269 = param1.readInteger();
         return true;
      }
   }
}
