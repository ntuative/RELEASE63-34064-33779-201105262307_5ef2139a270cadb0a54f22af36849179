package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2565:int;
      
      private var var_2654:int;
      
      private var var_1128:int;
      
      private var var_1130:int;
      
      private var var_1687:int;
      
      private var var_2653:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2565 = param1.readInteger();
         this.var_2654 = param1.readInteger();
         this.var_1128 = param1.readInteger();
         this.var_1130 = param1.readInteger();
         this.var_1687 = param1.readInteger();
         this.var_2653 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2565;
      }
      
      public function get charges() : int
      {
         return this.var_2654;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1128;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1130;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2653;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1687;
      }
   }
}
