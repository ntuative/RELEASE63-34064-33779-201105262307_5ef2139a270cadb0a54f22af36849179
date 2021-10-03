package com.sulake.habbo.ui.widget.furniture.teaser
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetTeaserDataUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetConversionPointMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetViralFurniMessage;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   
   public class TeaserFurniWidget extends RoomWidgetBase
   {
       
      
      private var var_141:IHabboConfigurationManager;
      
      private var var_13:IHabboInventory;
      
      private var _window:IFrameWindow;
      
      private var var_1477:int = -1;
      
      private var var_409:int = -1;
      
      private var _shareId:String;
      
      private var var_219:int = -1;
      
      private var var_1478:Array;
      
      private var var_1479:String;
      
      private var var_187:String;
      
      private var var_1480:int = 0;
      
      private const const_1969:int = 0;
      
      private const const_1964:int = 1;
      
      private const const_1968:int = 2;
      
      private const const_1966:int = 3;
      
      private const const_1967:int = 4;
      
      private const const_2239:int = 0;
      
      private const const_2243:int = 1;
      
      private const const_2241:int = 2;
      
      private const const_2242:int = 3;
      
      private const const_2237:int = 4;
      
      private const const_2238:int = 5;
      
      private const const_1965:String = "deco_img";
      
      private const const_1963:String = "dialog_bg";
      
      private const const_2240:String = "%campaign%_dialog_bg.png";
      
      private const const_364:String = "%campaign%_gift_package.png";
      
      private const const_2236:String = "%campaign%_gift_content.png";
      
      private const const_2244:String = "%campaign%_friend_gift_package.png";
      
      public function TeaserFurniWidget(param1:IRoomWidgetHandler, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboLocalizationManager, param5:IHabboConfigurationManager, param6:IHabboInventory)
      {
         super(param1,param2,param3,param4);
         this.var_141 = param5;
         this.var_13 = param6;
         this.var_1478 = new Array();
         this.var_1479 = this.var_141.getKey("image.library.url","http://images.habbo.com/c_images/");
         this.var_1479 += "Viral/";
      }
      
      override public function dispose() : void
      {
         var _loc2_:* = null;
         if(disposed)
         {
            return;
         }
         this.hideInterface();
         if(this._window != null && !this._window.disposed)
         {
            this._window.dispose();
            this._window = null;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.var_1478.length)
         {
            _loc2_ = this.var_1478.pop();
            _loc2_.dispose();
            _loc1_++;
         }
         this.var_141 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetTeaserDataUpdateEvent.const_471,this.onObjectUpdate);
         param1.addEventListener(RoomWidgetTeaserDataUpdateEvent.const_935,this.onObjectUpdate);
         param1.addEventListener(RoomWidgetTeaserDataUpdateEvent.const_709,this.onObjectUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetTeaserDataUpdateEvent.const_471,this.onObjectUpdate);
      }
      
      private function onObjectUpdate(param1:RoomWidgetTeaserDataUpdateEvent) : void
      {
         var _loc2_:int = 0;
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc3_:String = param1.campaignID;
         switch(param1.type)
         {
            case RoomWidgetTeaserDataUpdateEvent.const_471:
               _loc2_ = this.const_1969;
               this._shareId = null;
               break;
            case RoomWidgetTeaserDataUpdateEvent.const_709:
               _loc4_ = param1.firstClickUserName;
               _loc5_ = param1.giftWasReceived;
               if(_loc5_)
               {
                  if(_loc4_ && _loc4_ != "")
                  {
                     _loc2_ = this.const_1966;
                     var_64.registerParameter("widget.furni.teaser.notify.unlocked.desc","username",_loc4_);
                  }
                  else
                  {
                     _loc2_ = this.const_1968;
                  }
               }
               else
               {
                  _loc2_ = this.const_1967;
               }
               this._shareId = null;
               this.var_1480 = param1.itemCategory;
               break;
            case RoomWidgetTeaserDataUpdateEvent.const_935:
               _loc2_ = this.const_1964;
               this.var_219 = param1.objectId;
               this._shareId = param1.data;
               this.var_409 = param1.status;
               this.var_1480 = param1.itemCategory;
               var_64.registerParameter("notifications.viral_furni.fb.title","realname",param1.ownRealName);
               var_64.registerParameter("notifications.viral_furni.fb.desc","realname",param1.ownRealName);
               var_64.registerParameter("widget.furni.teaser.gift.unlocked.desc","username",param1.firstClickUserName);
               break;
            default:
               Logger.log("Error, invalid viral widget update message: " + param1.type);
         }
         if(this._window && (this.var_1477 != _loc2_ || _loc3_ != this.var_187))
         {
            this._window.dispose();
            this._window = null;
         }
         this.var_187 = _loc3_;
         this.var_1477 = _loc2_;
         this.mainWindow;
         this.showInterface();
      }
      
      override public function get mainWindow() : IWindow
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(this.var_1477 == -1)
         {
            return null;
         }
         if(!this._window)
         {
            switch(this.var_1477)
            {
               case this.const_1969:
                  _loc1_ = assets.getAssetByName("notification_teaser") as XmlAsset;
                  _loc2_ = this.const_364;
                  this.sendConversionPoint("viral_val11","client.show.teaser");
                  break;
               case this.const_1964:
                  if(this.var_409 == this.const_2239)
                  {
                     _loc1_ = assets.getAssetByName("notification_gift_locked") as XmlAsset;
                     this.sendConversionPoint("viral_" + this.var_187,"client.show.locked");
                     _loc2_ = this.const_364;
                  }
                  else if(this.var_409 == this.const_2243)
                  {
                     _loc1_ = assets.getAssetByName("notification_gift_unlocked") as XmlAsset;
                     this.sendConversionPoint("viral_" + this.var_187,"client.show.unlocked");
                     _loc2_ = this.const_2236;
                  }
                  else if(this.var_409 == this.const_2241)
                  {
                     _loc1_ = assets.getAssetByName("notification_gift_alert") as XmlAsset;
                     this.sendConversionPoint("viral_" + this.var_187,"client.show.no_fb");
                     _loc3_ = var_64.getKey("widget.furni.teaser.gift.no_fb.title");
                     _loc4_ = var_64.getKey("widget.furni.teaser.gift.no_fb.desc");
                     _loc2_ = this.const_364;
                  }
                  else if(this.var_409 == this.const_2242)
                  {
                     _loc1_ = assets.getAssetByName("notification_gift_alert") as XmlAsset;
                     this.sendConversionPoint("viral_" + this.var_187,"client.show.not_enough_fb_friends");
                     _loc3_ = var_64.getKey("widget.furni.teaser.gift.no_spam.title");
                     _loc4_ = var_64.getKey("widget.furni.teaser.gift.no_spam.desc");
                     _loc2_ = this.const_364;
                  }
                  else if(this.var_409 == this.const_2237)
                  {
                     _loc1_ = assets.getAssetByName("notification_gift_alert") as XmlAsset;
                     this.sendConversionPoint("viral_" + this.var_187,"client.show.not_enough_fb_friends");
                     _loc3_ = var_64.getKey("widget.furni.teaser.gift.no_min_fb_friends.title");
                     _loc4_ = var_64.getKey("widget.furni.teaser.gift.no_min_fb_friends.desc");
                     _loc2_ = this.const_364;
                  }
                  else if(this.var_409 == this.const_2238)
                  {
                     _loc1_ = assets.getAssetByName("notification_gift_alert") as XmlAsset;
                     this.sendConversionPoint("viral_" + this.var_187,"client.show.campaign_closed");
                     _loc3_ = var_64.getKey("widget.furni.teaser.gift.campaign_closed.title","widget.furni.teaser.gift.campaign_closed.title");
                     _loc4_ = var_64.getKey("widget.furni.teaser.gift.campaign_closed.desc","widget.furni.teaser.gift.campaign_closed.desc");
                     _loc2_ = this.const_364;
                  }
                  break;
               case this.const_1968:
                  _loc1_ = assets.getAssetByName("notification_gift_received") as XmlAsset;
                  _loc2_ = this.const_2244;
                  break;
               case this.const_1966:
                  _loc1_ = assets.getAssetByName("notification_gift_unlocked_notify") as XmlAsset;
                  _loc2_ = this.const_364;
                  break;
               case this.const_1967:
                  _loc1_ = assets.getAssetByName("notification_gift_alert") as XmlAsset;
                  _loc3_ = var_64.getKey("widget.furni.teaser.gift.campaign_closed.title","widget.furni.teaser.gift.campaign_closed.title");
                  _loc4_ = var_64.getKey("widget.furni.teaser.gift.campaign_closed.desc","widget.furni.teaser.gift.campaign_closed.desc");
            }
            if(_loc1_ == null)
            {
               return null;
            }
            this._window = windowManager.buildFromXML(_loc1_.content as XML) as IFrameWindow;
            this._window.header.controls.visible = false;
            this._window.center();
            this._window.visible = false;
            _loc5_ = this.const_2240.replace("%campaign%",this.var_187);
            this.setDecoImage(_loc5_,this.const_1963);
            _loc2_ = _loc2_.replace("%campaign%",this.var_187);
            this.setDecoImage(_loc2_,this.const_1965);
            if(_loc3_)
            {
               _loc6_ = this._window.findChildByName("alert_title") as ITextWindow;
               _loc6_.text = _loc3_;
            }
            if(_loc4_)
            {
               _loc6_ = this._window.findChildByName("alert_desc") as ITextWindow;
               _loc6_.text = _loc4_;
            }
            _loc7_ = this._window.findChildByName("teaser_ok_btn");
            if(_loc7_ != null)
            {
               _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onTeaserOkButton);
            }
            _loc7_ = this._window.findChildByName("no_fb_btn");
            if(_loc7_ != null)
            {
               _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onNoFbButton);
            }
            _loc7_ = this._window.findChildByName("received_ok_btn");
            if(_loc7_ != null)
            {
               _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onReceivedOkButton);
            }
            _loc7_ = this._window.findChildByName("skip_btn");
            if(_loc7_ != null)
            {
               _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onSkipButton);
            }
            _loc7_ = this._window.findChildByName("post_btn");
            if(_loc7_ != null)
            {
               _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPostButton);
            }
            _loc7_ = this._window.findChildByName("open_btn");
            if(_loc7_ != null)
            {
               _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onOpenButton);
            }
         }
         return this._window;
      }
      
      private function showInterface() : void
      {
         if(this._window == null)
         {
            return;
         }
         this._window.visible = true;
      }
      
      private function hideInterface() : void
      {
         if(this._window)
         {
            this._window.visible = false;
         }
      }
      
      private function onNoFbButton(param1:WindowEvent) : void
      {
         this.hideInterface();
      }
      
      private function onTeaserOkButton(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(messageListener != null)
         {
            _loc2_ = new RoomWidgetViralFurniMessage(RoomWidgetViralFurniMessage.const_883);
            messageListener.processWidgetMessage(_loc2_);
         }
         this.hideInterface();
      }
      
      private function onReceivedOkButton(param1:WindowEvent) : void
      {
         this.hideInterface();
      }
      
      private function onSkipButton(param1:WindowEvent) : void
      {
         this.sendConversionPoint("viral_" + this.var_187,"client.skip_post");
         this.hideInterface();
      }
      
      private function onPostButton(param1:WindowEvent) : void
      {
         var _loc2_:String = var_64.getKey("notifications.viral_furni.fb.title");
         var _loc3_:String = var_64.getKey("notifications.viral_furni.fb.desc");
         this.sendConversionPoint("viral_" + this.var_187,"client.start_post",this._shareId);
         var _loc4_:String = this.var_141.getKey("viral.furni.post_type","feed");
         HabboWebTools.facebookViralGiftPost(this.var_187,_loc2_,_loc3_,this._shareId,_loc4_);
         this.hideInterface();
      }
      
      private function onOpenButton(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(messageListener != null)
         {
            _loc2_ = new RoomWidgetViralFurniMessage(RoomWidgetViralFurniMessage.const_185);
            _loc2_.objectId = this.var_219;
            messageListener.processWidgetMessage(_loc2_);
         }
         this.hideInterface();
         if(this.var_13)
         {
            if(this.var_1480 != 0)
            {
               this.var_13.toggleInventoryPage(this.var_1480 == 1 ? "null" : InventoryCategory.const_123);
            }
         }
         this.sendConversionPoint("viral_" + this.var_187,"client.open_gift");
      }
      
      private function sendConversionPoint(param1:String, param2:String, param3:String = "") : void
      {
         var _loc4_:* = null;
         if(messageListener != null)
         {
            _loc4_ = new RoomWidgetConversionPointMessage(RoomWidgetConversionPointMessage.const_780,"ViralGift",param1,param2,param3);
            messageListener.processWidgetMessage(_loc4_);
         }
      }
      
      private function setDecoImage(param1:String, param2:String) : void
      {
         var _loc3_:IBitmapWrapperWindow = this._window.findChildByName(param2) as IBitmapWrapperWindow;
         if(!_loc3_)
         {
            return;
         }
         var _loc4_:IAsset = _assets.getAssetByName(param1);
         if(!_loc4_)
         {
            this.var_1478.push(new ImageDownloader(this,_assets,this.var_187,this.var_1479,param1,param2));
            return;
         }
         var _loc5_:BitmapData = (_loc4_.content as BitmapData).clone();
         switch(param2)
         {
            case this.const_1963:
            case this.const_1965:
               _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true,0);
               _loc3_.bitmap.copyPixels(_loc5_,_loc5_.rect,new Point(0,_loc3_.height - _loc5_.height),null,null,true);
         }
      }
      
      function onDecoImageReady(param1:ImageDownloader) : void
      {
         if(disposed)
         {
            return;
         }
         if(!this._window || this.var_187 != param1.campaignID)
         {
            return;
         }
         var _loc2_:IAsset = _assets.getAssetByName(param1.imageName);
         if(!_loc2_)
         {
            return;
         }
         this.setDecoImage(param1.imageName,param1.viewElementID);
      }
   }
}
