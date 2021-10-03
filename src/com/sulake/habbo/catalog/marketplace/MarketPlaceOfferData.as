package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData implements IMarketPlaceOfferData
   {
      
      public static const const_113:int = 1;
      
      public static const const_73:int = 2;
       
      
      private var var_1341:int;
      
      private var _furniId:int;
      
      private var var_2473:int;
      
      private var var_2175:String;
      
      private var var_1981:int;
      
      private var var_2268:int;
      
      private var var_2737:int;
      
      private var var_409:int;
      
      private var var_2472:int = -1;
      
      private var var_1982:int;
      
      private var var_47:BitmapData;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this.var_1341 = param1;
         this._furniId = param2;
         this.var_2473 = param3;
         this.var_2175 = param4;
         this.var_1981 = param5;
         this.var_409 = param6;
         this.var_2268 = param7;
         this.var_1982 = param8;
      }
      
      public function dispose() : void
      {
         if(this.var_47)
         {
            this.var_47.dispose();
            this.var_47 = null;
         }
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
      
      public function get averagePrice() : int
      {
         return this.var_2268;
      }
      
      public function get image() : BitmapData
      {
         return this.var_47;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_47 != null)
         {
            this.var_47.dispose();
         }
         this.var_47 = param1;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_2737 = param1;
      }
      
      public function get imageCallback() : int
      {
         return this.var_2737;
      }
      
      public function get status() : int
      {
         return this.var_409;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2472;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_2472 = param1;
      }
      
      public function set price(param1:int) : void
      {
         this.var_1981 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this.var_1341 = param1;
      }
      
      public function get offerCount() : int
      {
         return this.var_1982;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1982 = param1;
      }
   }
}
