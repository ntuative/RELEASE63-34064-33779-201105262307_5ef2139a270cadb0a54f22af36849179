package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetDanceMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetWaveMessage;
   
   public class OwnAvatarMenuView extends AvatarInfoView
   {
       
      
      private var _data:AvatarInfoData;
      
      public function OwnAvatarMenuView(param1:AvatarInfoWidget)
      {
         super(param1);
         var_1096 = false;
      }
      
      public static function setup(param1:OwnAvatarMenuView, param2:int, param3:String, param4:int, param5:int, param6:AvatarInfoData) : void
      {
         param1._data = param6;
         AvatarInfoView.setup(param1,param2,param3,param4,param5,false);
      }
      
      override protected function updateWindow() : void
      {
         var _loc2_:* = null;
         if(!_widget || true || true)
         {
            return;
         }
         if(!_window)
         {
            _loc2_ = XmlAsset(_widget.assets.getAssetByName("own_avatar_menu")).content as XML;
            _window = _widget.windowManager.buildFromXML(_loc2_,0) as IWindowContainer;
            if(!_window)
            {
               return;
            }
         }
         var _loc1_:IWindow = _window.findChildByName("buttons");
         _loc1_.procedure = this.buttonEventProc;
         _window.findChildByName("name").caption = _userName;
         _window.visible = false;
         this.updateButtons();
      }
      
      protected function updateButtons() : void
      {
         if(!_window || !this._data)
         {
            return;
         }
         var _loc1_:IItemListWindow = _window.findChildByName("buttons") as IItemListWindow;
         _loc1_.autoArrangeItems = false;
         var _loc2_:int = _loc1_.numListItems;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.getListItemAt(_loc3_).visible = false;
            _loc3_++;
         }
         if(this._data.allowNameChange)
         {
            _loc1_.getListItemByName("change_name").visible = true;
         }
         _loc1_.getListItemByName("change_looks").visible = true;
         _loc1_.getListItemByName("dance").visible = true;
         _loc1_.getListItemByName("wave").visible = true;
         _loc1_.getListItemByName("effects").visible = true;
         _loc1_.autoArrangeItems = true;
         _loc1_.visible = true;
      }
      
      private function buttonEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(disposed)
         {
            return;
         }
         if(!_window || false)
         {
            return;
         }
         var _loc3_:Boolean = false;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "button")
            {
               _loc3_ = true;
               switch(param2.parent.name)
               {
                  case "change_name":
                     _loc4_ = new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_468);
                     break;
                  case "change_looks":
                     _widget.openAvatarInfo();
                     break;
                  case "wave":
                     _loc4_ = new RoomWidgetWaveMessage();
                     break;
                  case "dance":
                     _loc4_ = new RoomWidgetDanceMessage(1);
                     break;
                  case "effects":
                     _loc4_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_784);
               }
            }
            if(_loc4_)
            {
               _widget.messageListener.processWidgetMessage(_loc4_);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            if(param2.name == "button")
            {
               param2.color = const_1353;
            }
            else if(param2.tags.indexOf("link") > -1)
            {
               if(param2.tags.indexOf("actions") > -1)
               {
                  ITextWindow(IWindowContainer(param2).getChildAt(0)).textColor = const_1355;
               }
            }
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            if(param2.name == "button")
            {
               param2.color = const_1356;
            }
            else if(param2.tags.indexOf("link") > -1)
            {
               if(param2.tags.indexOf("actions") > -1)
               {
                  ITextWindow(IWindowContainer(param2).getChildAt(0)).textColor = const_1354;
               }
            }
         }
         if(_loc3_)
         {
            _widget.removeView(this,false);
         }
      }
   }
}
