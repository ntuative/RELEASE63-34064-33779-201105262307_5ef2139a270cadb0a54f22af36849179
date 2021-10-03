package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1341:int;
      
      private var _furniId:int;
      
      private var var_2473:int;
      
      private var var_2175:String;
      
      private var var_1981:int;
      
      private var var_409:int;
      
      private var var_2472:int = -1;
      
      private var var_2268:int;
      
      private var var_1982:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this.var_1341 = param1;
         this._furniId = param2;
         this.var_2473 = param3;
         this.var_2175 = param4;
         this.var_1981 = param5;
         this.var_409 = param6;
         this.var_2472 = param7;
         this.var_2268 = param8;
         this.var_1982 = param9;
      }
      
      public function get offerId() : int
      {
         return this.var_1341;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2473;
      }
      
      public function get stuffData() : String
      {
         return this.var_2175;
      }
      
      public function get price() : int
      {
         return this.var_1981;
      }
      
      public function get status() : int
      {
         return this.var_409;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2472;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2268;
      }
      
      public function get offerCount() : int
      {
         return this.var_1982;
      }
   }
}
