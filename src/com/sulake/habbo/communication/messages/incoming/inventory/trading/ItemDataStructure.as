package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2420:int;
      
      private var var_1404:String;
      
      private var var_2425:int;
      
      private var var_2426:int;
      
      private var _category:int;
      
      private var var_2175:String;
      
      private var var_1536:int;
      
      private var var_2421:int;
      
      private var var_2423:int;
      
      private var var_2427:int;
      
      private var var_2424:int;
      
      private var var_2422:Boolean;
      
      private var var_3010:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2420 = param1;
         this.var_1404 = param2;
         this.var_2425 = param3;
         this.var_2426 = param4;
         this._category = param5;
         this.var_2175 = param6;
         this.var_1536 = param7;
         this.var_2421 = param8;
         this.var_2423 = param9;
         this.var_2427 = param10;
         this.var_2424 = param11;
         this.var_2422 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2420;
      }
      
      public function get itemType() : String
      {
         return this.var_1404;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2425;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2426;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2175;
      }
      
      public function get extra() : int
      {
         return this.var_1536;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2421;
      }
      
      public function get creationDay() : int
      {
         return this.var_2423;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2427;
      }
      
      public function get creationYear() : int
      {
         return this.var_2424;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2422;
      }
      
      public function get songID() : int
      {
         return this.var_1536;
      }
   }
}
