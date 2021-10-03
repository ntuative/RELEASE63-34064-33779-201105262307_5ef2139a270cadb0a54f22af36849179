package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2563:int;
      
      private var var_1404:String;
      
      private var _objId:int;
      
      private var var_1951:int;
      
      private var _category:int;
      
      private var var_2175:String;
      
      private var var_2758:Boolean;
      
      private var var_2760:Boolean;
      
      private var var_2759:Boolean;
      
      private var var_2212:Boolean;
      
      private var var_2516:int;
      
      private var var_1536:int;
      
      private var var_1793:String = "";
      
      private var var_1843:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2563 = param1;
         this.var_1404 = param2;
         this._objId = param3;
         this.var_1951 = param4;
         this._category = param5;
         this.var_2175 = param6;
         this.var_2758 = param7;
         this.var_2760 = param8;
         this.var_2759 = param9;
         this.var_2212 = param10;
         this.var_2516 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1793 = param1;
         this.var_1536 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2563;
      }
      
      public function get itemType() : String
      {
         return this.var_1404;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1951;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2175;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2758;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2760;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2759;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2212;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2516;
      }
      
      public function get slotId() : String
      {
         return this.var_1793;
      }
      
      public function get songId() : int
      {
         return this.var_1843;
      }
      
      public function get extra() : int
      {
         return this.var_1536;
      }
   }
}
