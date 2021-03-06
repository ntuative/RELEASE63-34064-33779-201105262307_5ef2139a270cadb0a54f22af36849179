package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2268:int;
      
      private var var_2265:int;
      
      private var var_2267:int;
      
      private var _dayOffsets:Array;
      
      private var var_2022:Array;
      
      private var var_2021:Array;
      
      private var var_2269:int;
      
      private var var_2266:int;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2268 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2265 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2267 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_2022 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_2021 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2269 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2266 = param1;
      }
   }
}
