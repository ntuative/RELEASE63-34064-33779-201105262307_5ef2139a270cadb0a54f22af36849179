package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import com.sulake.habbo.friendbar.data.IHabboFriendBarData;
   import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
   import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
   import com.sulake.habbo.friendbar.events.FriendRequestEvent;
   import com.sulake.habbo.friendbar.events.NewMessageEvent;
   import com.sulake.habbo.friendbar.events.NewRoomEventEvent;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarData;
   import com.sulake.habbo.friendbar.view.tabs.AddFriendsTab;
   import com.sulake.habbo.friendbar.view.tabs.FriendEntityTab;
   import com.sulake.habbo.friendbar.view.tabs.ITab;
   import com.sulake.habbo.friendbar.view.tabs.Tab;
   import com.sulake.habbo.friendbar.view.utils.FriendListIcon;
   import com.sulake.habbo.friendbar.view.utils.Icon;
   import com.sulake.habbo.friendbar.view.utils.MessengerIcon;
   import com.sulake.habbo.friendbar.view.utils.TextCropper;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboAlertDialogFlag;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class HabboFriendBarView extends Component implements IHabboFriendBarView, IAvatarImageListener
   {
      
      private static const const_1481:int = 127;
      
      private static const const_454:int = 1;
      
      private static const const_1476:int = 2;
      
      private static const const_651:int = 3;
      
      private static const const_1041:int = 3;
      
      private static const const_1483:Boolean = false;
      
      private static const const_652:int = 3;
      
      private static const const_1477:String = "arrow";
      
      private static const const_1488:String = "left";
      
      private static const const_1474:String = "right";
      
      private static const const_1472:String = "bar_xml";
      
      private static const const_1478:String = "toggle_xml";
      
      private static const const_79:String = "container";
      
      private static const const_1479:String = "wrapper";
      
      private static const const_1487:String = "border";
      
      private static const const_453:String = "list";
      
      private static const const_672:String = "header";
      
      private static const const_673:String = "canvas";
      
      private static const const_1040:String = "icon";
      
      private static const const_1485:String = "button_left";
      
      private static const const_1486:String = "button_right";
      
      private static const const_1489:String = "button_left_page";
      
      private static const const_1475:String = "button_right_page";
      
      private static const const_1484:String = "button_left_end";
      
      private static const const_1473:String = "button_right_end";
      
      private static const const_1357:String = "button_close";
      
      private static const const_1482:String = "button_open";
      
      private static const const_1480:String = "messenger";
      
      private static const const_1039:String = "friendlist";
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1081:IAvatarRenderManager;
      
      private var var_99:IHabboFriendBarData;
      
      private var var_49:IWindowContainer;
      
      private var var_204:IWindowContainer;
      
      private var var_98:Vector.<ITab>;
      
      private var var_1483:ITab;
      
      private var var_984:int = -1;
      
      private var _startIndex:int = 0;
      
      private var var_1482:TextCropper;
      
      private var var_776:FriendListIcon;
      
      private var var_520:MessengerIcon;
      
      private var var_1484:Boolean = true;
      
      public function HabboFriendBarView(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
         this.var_1482 = new TextCropper();
         this.var_98 = new Vector.<ITab>();
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRendererAvailable);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerAvailable);
         queueInterface(new IIDHabboFriendBarData(),this.onFriendBarDataAvailable);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            this._windowManager.getWindowContext(const_454).getDesktopWindow().removeEventListener(WindowEvent.const_40,this.onDesktopResized);
            if(this.var_520)
            {
               this.var_520.dispose();
               this.var_520 = null;
            }
            if(this.var_776)
            {
               this.var_776.dispose();
               this.var_776 = null;
            }
            if(this.var_204)
            {
               this.var_204.dispose();
               this.var_204 = null;
            }
            if(this.var_49)
            {
               this.var_49.dispose();
               this.var_49 = null;
            }
            while(this.var_98.length > 0)
            {
               ITab(this.var_98.pop()).dispose();
            }
            if(this.var_99)
            {
               this.var_99.events.removeEventListener(FriendBarUpdateEvent.const_913,this.onRefreshView);
               this.var_99 = null;
               release(new IIDHabboFriendBarData());
            }
            if(this._windowManager)
            {
               this._windowManager = null;
               release(new IIDHabboWindowManager());
            }
            if(this.var_1081)
            {
               this.var_1081 = null;
               release(new IIDAvatarRenderManager());
            }
            this.var_1482.dispose();
            this.var_1482 = null;
            super.dispose();
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(this.var_49)
         {
            this.var_49.visible = param1;
            this.var_49.activate();
         }
         if(this.var_204)
         {
            this.var_204.visible = !param1;
            if(this.var_49)
            {
               this.var_204.x = this.var_49.x;
               this.var_204.y = this.var_49.y;
               this.var_204.activate();
            }
         }
      }
      
      public function get visible() : Boolean
      {
         return this.var_49 && this.var_49.visible;
      }
      
      public function populate() : void
      {
         var _loc5_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc1_:int = this.var_984;
         this.deSelect();
         var _loc2_:IWindowContainer = this.var_49.findChildByName(const_79) as IWindowContainer;
         var _loc3_:IItemListWindow = _loc2_.findChildByName(const_453) as IItemListWindow;
         _loc3_.autoArrangeItems = false;
         var _loc4_:int = _loc3_.numListItems;
         _loc5_ = _loc4_;
         while(_loc5_ > 0)
         {
            _loc3_.removeListItemAt(_loc5_ - 1);
            _loc5_--;
         }
         while(this.var_98.length > 0)
         {
            this.var_98.pop().recycle();
         }
         var _loc6_:int = this.var_99.numFriends + (!!this.var_1484 ? 1 : 0);
         var _loc7_:int = Math.min(this.maxNumOfTabsVisible,_loc6_);
         if(this._startIndex + _loc7_ > _loc6_)
         {
            this._startIndex = Math.max(0,this._startIndex - (this._startIndex + _loc7_ - _loc6_));
         }
         _loc4_ = Math.min(this.var_99.numFriends,this._startIndex + _loc7_);
         _loc5_ = this._startIndex;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = this.var_99.getFriendAt(_loc5_);
            _loc9_ = FriendEntityTab.allocate(_loc8_);
            this.var_98.push(_loc9_);
            _loc3_.addListItem(_loc9_.window);
            _loc5_++;
         }
         if(this.var_1484)
         {
            _loc10_ = this.maxNumOfTabsVisible;
            if(this.var_98.length < _loc10_)
            {
               _loc11_ = 1;
               if(this.var_98.length + _loc11_ < const_652)
               {
                  _loc11_ = Math.min(_loc10_ - this.var_98.length,const_652 - this.var_98.length);
               }
               _loc6_ = this.var_99.numFriends + _loc11_;
               while(_loc11_-- > 0)
               {
                  _loc12_ = AddFriendsTab.allocate();
                  _loc3_.addListItem(_loc12_.window);
                  this.var_98.push(_loc12_);
               }
            }
         }
         _loc3_.autoArrangeItems = true;
         if(_loc1_ > -1)
         {
            this.selectFriendEntity(_loc1_);
         }
         _loc2_.visible = this.var_98.length > 0;
         this.toggleArrowButtons(this.var_98.length < _loc6_,this._startIndex != 0,this._startIndex + this.var_98.length < _loc6_);
      }
      
      private function getFriendEntityTabByID(param1:int) : FriendEntityTab
      {
         var _loc2_:* = null;
         var _loc3_:int = this.var_98.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_98[_loc4_] as FriendEntityTab;
            if(_loc2_)
            {
               if(_loc2_.friend.id == param1)
               {
                  return _loc2_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      private function onFriendBarDataAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_99 = param2 as IHabboFriendBarData;
         this.var_99.events.addEventListener(FriendBarUpdateEvent.const_913,this.onRefreshView);
         this.var_99.events.addEventListener(FindFriendsNotificationEvent.TYPE,this.onFindFriendsNotification);
         this.var_99.events.addEventListener(FriendRequestEvent.const_1190,this.onFriendRequestUpdate);
         this.var_99.events.addEventListener(NewMessageEvent.const_1295,this.onNewInstantMessage);
         this.var_99.events.addEventListener(NewRoomEventEvent.const_1176,this.onNewRoomEvent);
      }
      
      private function onWindowManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function isUserInterfaceReady() : Boolean
      {
         return this.var_49 && !this.var_49.disposed;
      }
      
      private function buildUserInterface() : void
      {
         var _loc2_:* = null;
         Tab.var_1094 = this.var_99;
         Tab.var_1633 = this;
         Tab.var_883 = assets;
         Tab.var_1351 = this._windowManager;
         Tab.var_2157 = this.var_1482;
         var _loc1_:IAsset = assets.getAssetByName(const_1472);
         this.var_49 = this._windowManager.buildFromXML(_loc1_.content as XML,const_454) as IWindowContainer;
         this.var_49.x = const_651;
         this.var_49.y = this.var_49.parent.height - (this.var_49.height + const_1476);
         this.var_49.width = this.var_49.parent.width - (const_651 + const_1041);
         this.var_49.setParamFlag(WindowParam.const_290,true);
         this.var_49.procedure = this.barWindowEventProc;
         if(const_1483)
         {
            _loc1_ = assets.getAssetByName(const_1478);
            this.var_204 = this._windowManager.buildFromXML(_loc1_.content as XML,const_454) as IWindowContainer;
            this.var_204.x = this.var_49.x;
            this.var_204.y = this.var_49.y;
            this.var_204.setParamFlag(WindowParam.const_290,true);
            this.var_204.visible = false;
            this.var_204.procedure = this.toggleWindowEventProc;
         }
         _loc2_ = IWindowContainer(this.var_49.findChildByName(const_1039));
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.const_25,this.onIconMouseEvent);
         this.var_776 = new FriendListIcon(assets,_loc2_.getChildByName(const_1040) as IBitmapWrapperWindow);
         _loc2_ = IWindowContainer(this.var_49.findChildByName(const_1480));
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.const_25,this.onIconMouseEvent);
         this.var_520 = new MessengerIcon(assets,_loc2_.getChildByName(const_1040) as IBitmapWrapperWindow);
         this.var_520.enable(false);
         this.visible = true;
         this._windowManager.getWindowContext(const_454).getDesktopWindow().addEventListener(WindowEvent.const_40,this.onDesktopResized);
      }
      
      private function onAvatarRendererAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_1081 = param2 as IAvatarRenderManager;
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!_loc2_)
         {
            if(this.var_1081)
            {
               _loc3_ = this.var_1081.createAvatarImage(param1,AvatarScaleType.const_57,null,this);
               if(_loc3_)
               {
                  _loc2_ = _loc3_.getCroppedImage(AvatarSetType.const_52);
                  _loc3_.dispose();
               }
            }
         }
         return _loc2_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc3_:IItemListWindow = this.var_49.findChildByName(const_453) as IItemListWindow;
         var _loc4_:int = this.var_99.numFriends;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_99.getFriendAt(_loc5_);
            if(_loc2_.figure == param1)
            {
               _loc6_ = this.getAvatarFaceBitmap(_loc2_.figure);
               if(_loc6_)
               {
                  _loc7_ = _loc3_.getListItemByID(_loc2_.id) as IWindowContainer;
                  if(_loc7_)
                  {
                     _loc8_ = _loc7_.getChildByName(const_453) as IItemListWindow;
                     if(_loc8_)
                     {
                        _loc9_ = IWindowContainer(_loc8_.getListItemByName(const_672));
                        if(_loc9_)
                        {
                           _loc10_ = _loc9_.findChildByName(const_673) as IBitmapWrapperWindow;
                           _loc10_.bitmap = _loc6_;
                           _loc10_.width = _loc6_.width;
                           _loc10_.height = _loc6_.height;
                        }
                     }
                  }
               }
            }
            _loc5_++;
         }
      }
      
      public function faceBookImageReady(param1:BitmapData) : void
      {
      }
      
      private function isFriendSelected(param1:IFriendEntity) : Boolean
      {
         return this.var_984 == param1.id;
      }
      
      public function selectTab(param1:ITab) : void
      {
         if(!param1.selected)
         {
            if(this.var_1483)
            {
               this.deSelect();
            }
            param1.select();
            this.var_1483 = param1;
            if(param1 is FriendEntityTab)
            {
               this.var_984 = FriendEntityTab(param1).friend.id;
            }
         }
      }
      
      public function selectFriendEntity(param1:int) : void
      {
         if(this.var_984 == param1)
         {
            return;
         }
         var _loc2_:FriendEntityTab = this.getFriendEntityTabByID(param1);
         if(_loc2_)
         {
            this.selectTab(_loc2_);
            this.var_984 = param1;
         }
      }
      
      public function deSelect() : void
      {
         if(this.var_1483)
         {
            this.var_1483.deselect();
            this.var_984 = -1;
         }
      }
      
      private function onRefreshView(param1:Event) : void
      {
         if(!this.isUserInterfaceReady())
         {
            this.buildUserInterface();
         }
         this.resizeAndPopulate(true);
      }
      
      private function onFindFriendsNotification(param1:FindFriendsNotificationEvent) : void
      {
         var event:FindFriendsNotificationEvent = param1;
         var title:String = !!event.success ? "${friendbar.find.success.title}" : "${friendbar.find.error.title}";
         var text:String = !!event.success ? "${friendbar.find.success.text}" : "${friendbar.find.error.text}";
         this._windowManager.notify(title,text,function(param1:IAlertDialog, param2:WindowEvent):void
         {
            param1.dispose();
         },HabboAlertDialogFlag.const_474);
      }
      
      private function onFriendRequestUpdate(param1:FriendRequestEvent) : void
      {
         if(this.var_776)
         {
            this.var_776.notify(this.var_99.numFriendRequests > 0);
         }
      }
      
      private function onNewInstantMessage(param1:NewMessageEvent) : void
      {
         if(this.var_520)
         {
            if(param1.notify)
            {
               this.var_520.notify(true);
            }
            else
            {
               this.var_520.enable(true);
            }
         }
      }
      
      private function onNewRoomEvent(param1:NewRoomEventEvent) : void
      {
      }
      
      private function barWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1.type == WindowMouseEvent.const_43)
         {
            _loc3_ = this._startIndex;
            _loc4_ = this.var_99.numFriends + (!!this.var_1484 ? 1 : 0);
            switch(param2.name)
            {
               case const_1485:
                  _loc3_ = Math.max(0,this._startIndex - 1);
                  break;
               case const_1489:
                  _loc3_ = Math.max(0,this._startIndex - this.maxNumOfTabsVisible);
                  break;
               case const_1484:
                  _loc3_ = 0;
                  break;
               case const_1486:
                  _loc3_ = Math.max(0,Math.min(_loc4_ - this.maxNumOfTabsVisible,this._startIndex + 1));
                  break;
               case const_1475:
                  _loc3_ = Math.max(0,Math.min(_loc4_ - this.maxNumOfTabsVisible,this._startIndex + this.maxNumOfTabsVisible));
                  break;
               case const_1473:
                  _loc3_ = Math.max(0,_loc4_ - this.maxNumOfTabsVisible);
                  break;
               case const_1357:
                  this.visible = false;
                  break;
               case const_1487:
                  this.deSelect();
            }
            if(_loc3_ != this._startIndex)
            {
               this.deSelect();
               this._startIndex = _loc3_;
               this.resizeAndPopulate(true);
            }
         }
         if(param1.type == WindowEvent.const_580)
         {
            this.deSelect();
         }
      }
      
      private function onIconMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:Icon = param1.window.name == const_1039 ? this.var_776 : this.var_520;
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(_loc2_ is FriendListIcon)
               {
                  this.var_99.toggleFriendList();
                  _loc2_.notify(false);
               }
               else if(_loc2_ is MessengerIcon)
               {
                  this.var_99.toggleMessenger();
                  _loc2_.notify(false);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               _loc2_.hover(true);
               break;
            case WindowMouseEvent.const_25:
               _loc2_.hover(false);
         }
      }
      
      private function toggleWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(this.var_204.visible)
         {
            if(param1.type == WindowMouseEvent.const_43)
            {
               switch(param2.name)
               {
                  case const_1482:
                     this.visible = true;
               }
            }
         }
      }
      
      private function toggleArrowButtons(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:IWindowContainer = this.var_49.findChildByName(const_1479) as IWindowContainer;
         _loc5_ = [];
         _loc6_.groupChildrenWithTag(const_1477,_loc5_);
         for each(_loc4_ in _loc5_)
         {
            _loc4_.visible = param1;
         }
         _loc5_ = [];
         _loc6_.groupChildrenWithTag(const_1488,_loc5_);
         for each(_loc4_ in _loc5_)
         {
            if(param2)
            {
               _loc4_.enable();
            }
            else
            {
               _loc4_.disable();
            }
         }
         _loc5_ = [];
         _loc6_.groupChildrenWithTag(const_1474,_loc5_);
         for each(_loc4_ in _loc5_)
         {
            if(param3)
            {
               _loc4_.enable();
            }
            else
            {
               _loc4_.disable();
            }
         }
      }
      
      private function resizeAndPopulate(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(!disposed)
         {
            if(this.var_49)
            {
               this.var_49.width = this.var_49.parent.width - (const_651 + const_1041);
               if(!param1)
               {
                  _loc2_ = this.maxNumOfTabsVisible;
                  if(_loc2_ < this.var_98.length)
                  {
                     param1 = true;
                  }
                  else if(_loc2_ > this.var_98.length)
                  {
                     if(this.var_98.length < const_652)
                     {
                        param1 = true;
                     }
                     else if(this.var_98.length < this.var_99.numFriends + (!!this.var_1484 ? 1 : 0))
                     {
                        param1 = true;
                     }
                     else if(this.numFriendEntityTabsVisible < this.var_99.numFriends)
                     {
                        param1 = true;
                     }
                  }
               }
               if(param1)
               {
                  this.populate();
               }
            }
         }
      }
      
      private function get numFriendEntityTabsVisible() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = this.var_98.length;
         while(_loc2_-- > 0)
         {
            if(this.var_98[_loc2_] is FriendEntityTab)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      private function get maxNumOfTabsVisible() : int
      {
         var _loc1_:IWindowContainer = this.var_49.findChildByName(const_79) as IWindowContainer;
         var _loc2_:IWindowContainer = _loc1_.getChildByName("wrapper") as IWindowContainer;
         var _loc3_:IItemListWindow = _loc2_.findChildByName(const_453) as IItemListWindow;
         var _loc4_:int = _loc2_.width - _loc3_.width;
         return (_loc1_.width - _loc4_) / (const_1481 + _loc3_.spacing);
      }
      
      private function onDesktopResized(param1:WindowEvent) : void
      {
         this.resizeAndPopulate(false);
      }
   }
}
