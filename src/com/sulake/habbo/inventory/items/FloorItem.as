package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var _category:int;
      
      protected var _type:int;
      
      protected var var_2175:String;
      
      protected var var_1536:Number;
      
      protected var var_2955:Boolean;
      
      protected var var_2956:Boolean;
      
      protected var var_2422:Boolean;
      
      protected var var_2703:Boolean;
      
      protected var var_2966:int;
      
      protected var var_2423:int;
      
      protected var var_2427:int;
      
      protected var var_2424:int;
      
      protected var var_1793:String;
      
      protected var var_1843:int;
      
      protected var var_923:Boolean;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         this._id = param1;
         this._type = param2;
         this._ref = param3;
         this._category = param4;
         this.var_2422 = param5;
         this.var_2956 = param6;
         this.var_2955 = param7;
         this.var_2703 = param8;
         this.var_2175 = param9;
         this.var_1536 = param10;
         this.var_2966 = param11;
         this.var_2423 = param12;
         this.var_2427 = param13;
         this.var_2424 = param14;
         this.var_1793 = param15;
         this.var_1843 = param16;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ref() : int
      {
         return this._ref;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get stuffData() : String
      {
         return this.var_2175;
      }
      
      public function get extra() : Number
      {
         return this.var_1536;
      }
      
      public function get recyclable() : Boolean
      {
         return this.var_2955;
      }
      
      public function get tradeable() : Boolean
      {
         return this.var_2956;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2422;
      }
      
      public function get sellable() : Boolean
      {
         return this.var_2703;
      }
      
      public function get expires() : int
      {
         return this.var_2966;
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
      
      public function get slotId() : String
      {
         return this.var_1793;
      }
      
      public function get songId() : int
      {
         return this.var_1843;
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.var_923 = param1;
      }
      
      public function get locked() : Boolean
      {
         return this.var_923;
      }
   }
}
