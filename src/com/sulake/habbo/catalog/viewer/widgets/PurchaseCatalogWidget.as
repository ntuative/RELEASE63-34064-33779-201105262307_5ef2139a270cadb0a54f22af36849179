package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetInitPurchaseEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2922:XML;
      
      private var var_2921:XML;
      
      private var var_2923:XML;
      
      private var var_1087:IWindowContainer;
      
      private var var_696:IButtonWindow;
      
      private var var_3023:IButtonWindow;
      
      private var var_2100:ITextWindow;
      
      private var var_2102:ITextWindow;
      
      private var var_2101:ITextWindow;
      
      private var var_2995:ITextWindow;
      
      private var var_96:Offer;
      
      private var var_2099:String = "";
      
      private var var_1623:Function;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         events.removeEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.removeEventListener(WidgetEvent.const_896,this.onSetParameter);
         events.removeEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            this.var_2922 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            this.var_2921 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            this.var_2923 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.addEventListener(WidgetEvent.const_896,this.onSetParameter);
         events.addEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
         events.addEventListener(WidgetEvent.CWE_INIT_PURCHASE,this.initPurchase);
         return true;
      }
      
      private function onPurchaseOverride(param1:CatalogWidgetPurchaseOverrideEvent) : void
      {
         this.var_1623 = param1.callback;
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_968:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2922) as IWindowContainer;
               break;
            case Offer.const_1175:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2921) as IWindowContainer;
               break;
            case Offer.const_1306:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2923) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach..." + this.var_96.priceType);
         }
         if(_loc2_ != null)
         {
            if(this.var_1087 != null)
            {
               _window.removeChild(this.var_1087);
               this.var_1087.dispose();
            }
            this.var_1087 = _loc2_;
            _window.addChild(_loc2_);
            this.var_1087.x = 0;
            this.var_1087.y = 0;
         }
         this.var_2100 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         this.var_2102 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         this.var_2101 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         this.var_2995 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         this.var_696 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(this.var_696 != null)
         {
            if(this.var_1623 != null)
            {
               this.var_696.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1623);
            }
            else
            {
               this.var_696.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1623);
               this.var_696.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPurchase);
            }
            this.var_696.disable();
         }
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         this.var_96 = param1.offer;
         this.attachStub(this.var_96.priceType);
         if(this.var_2100 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(this.var_96.priceInCredits));
            this.var_2100.caption = "${catalog.purchase.price.credits}";
         }
         var _loc3_:String = this.var_96.activityPointType == ActivityPointTypeEnum.PIXEL ? "pixels" : "activitypoints";
         if(this.var_2102 != null)
         {
            _loc4_ = "catalog.purchase.price.activitypoints." + this.var_96.activityPointType;
            _loc2_.registerParameter(_loc4_,_loc3_,this.var_96.priceInActivityPoints.toString());
            this.var_2102.caption = _loc2_.getKey(_loc4_);
         }
         if(this.var_2101 != null)
         {
            _loc4_ = "catalog.purchase.price.credits+activitypoints." + this.var_96.activityPointType;
            _loc2_.registerParameter(_loc4_,"credits",String(this.var_96.priceInCredits));
            _loc2_.registerParameter(_loc4_,_loc3_,String(this.var_96.priceInActivityPoints));
            this.var_2101.caption = _loc2_.getKey(_loc4_);
         }
         var _loc5_:IWindow = _window.findChildByName("activity_points_bg");
         if(_loc5_ != null)
         {
            _loc5_.color = this.var_96.activityPointType == 0 ? 6737151 : uint(13421772);
         }
         if(this.var_696 != null)
         {
            this.var_696.enable();
         }
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         this.var_2099 = param1.parameter;
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(this.var_96 != null)
         {
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_96,page.pageId,this.var_2099);
         }
      }
      
      private function initPurchase(param1:CatalogWidgetInitPurchaseEvent) : void
      {
         if(this.var_96 != null)
         {
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_96,page.pageId,this.var_2099,param1.enableBuyAsGift);
         }
      }
   }
}
