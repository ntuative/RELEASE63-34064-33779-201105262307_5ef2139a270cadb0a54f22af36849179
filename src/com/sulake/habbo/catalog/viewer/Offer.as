package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1924:String = "pricing_model_unknown";
      
      public static const const_372:String = "pricing_model_single";
      
      public static const const_412:String = "pricing_model_multi";
      
      public static const const_549:String = "pricing_model_bundle";
      
      public static const const_1863:String = "price_type_none";
      
      public static const const_968:String = "price_type_credits";
      
      public static const const_1175:String = "price_type_activitypoints";
      
      public static const const_1306:String = "price_type_credits_and_activitypoints";
       
      
      private var var_732:String;
      
      private var var_1129:String;
      
      private var var_1341:int;
      
      private var var_1686:String;
      
      private var var_1128:int;
      
      private var var_1130:int;
      
      private var var_1687:int;
      
      private var var_358:ICatalogPage;
      
      private var var_591:IProductContainer;
      
      private var _disposed:Boolean = false;
      
      private var var_2291:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:Array, param7:ICatalogPage)
      {
         super();
         this.var_1341 = param1;
         this.var_1686 = param2;
         this.var_1128 = param3;
         this.var_1130 = param4;
         this.var_1687 = param5;
         this.var_358 = param7;
         this.analyzePricingModel(param6);
         this.analyzePriceType();
         this.createProductContainer(param6);
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_358;
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
      
      public function get activityPointType() : int
      {
         return this.var_1687;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_591;
      }
      
      public function get pricingModel() : String
      {
         return this.var_732;
      }
      
      public function get priceType() : String
      {
         return this.var_1129;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2291;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2291 = param1;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1341 = 0;
         this.var_1686 = "";
         this.var_1128 = 0;
         this.var_1130 = 0;
         this.var_1687 = 0;
         this.var_358 = null;
         if(this.var_591 != null)
         {
            this.var_591.dispose();
            this.var_591 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_732)
         {
            case const_372:
               this.var_591 = new SingleProductContainer(this,param1);
               break;
            case const_412:
               this.var_591 = new MultiProductContainer(this,param1);
               break;
            case const_549:
               this.var_591 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_732);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_732 = const_372;
            }
            else
            {
               this.var_732 = const_412;
            }
         }
         else if(param1.length > 1)
         {
            this.var_732 = const_549;
         }
         else
         {
            this.var_732 = const_1924;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1128 > 0 && this.var_1130 > 0)
         {
            this.var_1129 = const_1306;
         }
         else if(this.var_1128 > 0)
         {
            this.var_1129 = const_968;
         }
         else if(this.var_1130 > 0)
         {
            this.var_1129 = const_1175;
         }
         else
         {
            this.var_1129 = const_1863;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_358.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_591.products)
         {
            _loc4_ = this.var_358.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,_loc1_,this.page);
      }
   }
}
