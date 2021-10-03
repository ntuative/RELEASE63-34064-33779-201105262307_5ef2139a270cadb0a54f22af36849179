package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1341:int;
      
      private var var_1801:String;
      
      private var var_1981:int;
      
      private var _upgrade:Boolean;
      
      private var var_2731:Boolean;
      
      private var var_2729:int;
      
      private var var_2727:int;
      
      private var var_2730:int;
      
      private var var_2728:int;
      
      private var var_2732:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1341 = param1.readInteger();
         this.var_1801 = param1.readString();
         this.var_1981 = param1.readInteger();
         this._upgrade = param1.readBoolean();
         this.var_2731 = param1.readBoolean();
         this.var_2729 = param1.readInteger();
         this.var_2727 = param1.readInteger();
         this.var_2730 = param1.readInteger();
         this.var_2728 = param1.readInteger();
         this.var_2732 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1341;
      }
      
      public function get productCode() : String
      {
         return this.var_1801;
      }
      
      public function get price() : int
      {
         return this.var_1981;
      }
      
      public function get upgrade() : Boolean
      {
         return this._upgrade;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2731;
      }
      
      public function get periods() : int
      {
         return this.var_2729;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2727;
      }
      
      public function get year() : int
      {
         return this.var_2730;
      }
      
      public function get month() : int
      {
         return this.var_2728;
      }
      
      public function get day() : int
      {
         return this.var_2732;
      }
   }
}
