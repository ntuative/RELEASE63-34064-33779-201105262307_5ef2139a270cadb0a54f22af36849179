package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_1341:int;
      
      private var var_1686:String;
      
      private var var_1128:int;
      
      private var var_1130:int;
      
      private var var_1687:int;
      
      private var var_1219:Array;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1341 = param1.readInteger();
         this.var_1686 = param1.readString();
         this.var_1128 = param1.readInteger();
         this.var_1130 = param1.readInteger();
         this.var_1687 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1219 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1219.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get offerId() : int
      {
         return this.var_1341;
      }
      
      public function get localizationId() : String
      {
         return this.var_1686;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1128;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1130;
      }
      
      public function get products() : Array
      {
         return this.var_1219;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1687;
      }
   }
}
