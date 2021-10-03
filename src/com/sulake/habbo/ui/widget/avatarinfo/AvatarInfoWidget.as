package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.session.IUserData;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.handler.AvatarInfoWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetAvatarInfoEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectNameEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserDataUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserLocationUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetGetUserLocationMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class AvatarInfoWidget extends RoomWidgetBase implements IUpdateReceiver
   {
       
      
      private var var_23:Component;
      
      private var var_195:IHabboConfigurationManager;
      
      private var _view:AvatarInfoView;
      
      private var var_198:Boolean = false;
      
      private var var_1661:Boolean = false;
      
      private var var_222:AvatarInfoData;
      
      private var var_2237:Boolean;
      
      private var var_1660:Boolean;
      
      private var var_1659:int = -1;
      
      private var var_2968:Boolean;
      
      private var var_720:AvatarInfoView;
      
      private var var_721:OwnAvatarMenuView;
      
      private var var_719:AvatarMenuView;
      
      private var var_345:Map;
      
      public function AvatarInfoWidget(param1:IRoomWidgetHandler, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboConfigurationManager, param5:IHabboLocalizationManager, param6:Component)
      {
         super(param1,param2,param3,param5);
         this.var_23 = param6;
         this.var_195 = param4;
         this.var_222 = new AvatarInfoData();
         this.var_2237 = Boolean(this.var_195.getBoolean("menu.avatar.enabled",false));
         this.var_1660 = this.var_195.getBoolean("menu.own_avatar.enabled",false);
         this.var_345 = new Map();
         var _loc7_:AvatarInfoWidgetHandler = param1 as AvatarInfoWidgetHandler;
         _loc7_.roomEngine.events.addEventListener(RoomEngineObjectEvent.const_256,this.onRoomObjectAdded);
         _loc7_.roomEngine.events.addEventListener(RoomEngineObjectEvent.const_411,this.onRoomObjectRemoved);
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_195;
      }
      
      private function onRoomObjectAdded(param1:RoomEngineObjectEvent) : void
      {
         var _loc2_:* = null;
         if(param1.category == RoomObjectCategoryEnum.const_32)
         {
            _loc2_ = AvatarInfoWidgetHandler(handler).roomSession.userDataManager.getUserDataByIndex(param1.objectId);
            if(_loc2_)
            {
               if(AvatarInfoWidgetHandler(handler).friendList.getFriendNames().indexOf(_loc2_.name) > -1)
               {
                  this.showFriendName(_loc2_,param1.objectId);
               }
            }
         }
      }
      
      private function onRoomObjectRemoved(param1:RoomEngineObjectEvent) : void
      {
         var _loc2_:* = null;
         if(param1.category == RoomObjectCategoryEnum.const_32)
         {
            for each(_loc2_ in this.var_345)
            {
               if(_loc2_.objectId == param1.objectId)
               {
                  this.removeView(_loc2_,false);
               }
            }
         }
      }
      
      private function getOwnCharacterInfo() : void
      {
         messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_877,0,0));
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(disposed)
         {
            return;
         }
         for each(_loc1_ in this.var_345)
         {
            _loc1_.dispose();
         }
         this.var_345 = null;
         if(this.var_23)
         {
            this.var_23.removeUpdateReceiver(this);
            this.var_23 = null;
         }
         if(this.var_720)
         {
            this.var_720.dispose();
            this.var_720 = null;
         }
         if(this.var_719)
         {
            this.var_719.dispose();
            this.var_719 = null;
         }
         if(this.var_721)
         {
            this.var_721.dispose();
            this.var_721 = null;
         }
         if(this._view)
         {
            if(!this._view.disposed)
            {
               this._view.dispose();
               this._view = null;
            }
         }
         var _loc2_:AvatarInfoWidgetHandler = handler as AvatarInfoWidgetHandler;
         _loc2_.roomEngine.events.removeEventListener(RoomEngineObjectEvent.const_256,this.onRoomObjectAdded);
         _loc2_.roomEngine.events.removeEventListener(RoomEngineObjectEvent.const_411,this.onRoomObjectRemoved);
         this._view = null;
         this.var_195 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetAvatarInfoEvent.const_125,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_105,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_139,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_138,this.updateEventHandler);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_343,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.const_114,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserDataUpdateEvent.const_126,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_172,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_93,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_379,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectNameEvent.const_510,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_938,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_415,this.updateEventHandler);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetAvatarInfoEvent.const_125,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_105,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_139,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_138,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_343,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.const_114,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserDataUpdateEvent.const_126,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_172,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_93,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_379,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectNameEvent.const_510,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_415,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_415,this.updateEventHandler);
      }
      
      private function updateEventHandler(param1:RoomWidgetUpdateEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         switch(param1.type)
         {
            case RoomWidgetAvatarInfoEvent.const_125:
               _loc2_ = param1 as RoomWidgetAvatarInfoEvent;
               _loc3_ = !!this.var_1660 ? false : Boolean(_loc2_.allowNameChange);
               this.updateView(_loc2_.userId,_loc2_.userName,_loc2_.roomIndex,RoomObjectTypeEnum.const_129,_loc3_,null);
               this.var_198 = true;
               break;
            case RoomWidgetRoomObjectNameEvent.const_510:
               if(RoomWidgetRoomObjectNameEvent(param1).category == RoomObjectCategoryEnum.const_32)
               {
                  this.updateView(RoomWidgetRoomObjectNameEvent(param1).userId,RoomWidgetRoomObjectNameEvent(param1).userName,RoomWidgetRoomObjectNameEvent(param1).roomIndex,RoomObjectTypeEnum.const_129,false,null);
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_138:
            case RoomWidgetFurniInfoUpdateEvent.const_343:
               if(this._view)
               {
                  this.removeView(this._view,false);
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_938:
               if(!(this._view is AvatarMenuView))
               {
                  this.var_1659 = RoomWidgetRoomObjectUpdateEvent(param1).id;
                  messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_921,RoomWidgetRoomObjectUpdateEvent(param1).id,RoomWidgetRoomObjectUpdateEvent(param1).category));
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_415:
               if(!(this._view is AvatarMenuView || this._view is OwnAvatarMenuView))
               {
                  if(RoomWidgetRoomObjectUpdateEvent(param1).id == this.var_1659)
                  {
                     if(this._view && !this._view.allowNameChange)
                     {
                        this.removeView(this._view,false);
                        this.var_1659 = -1;
                     }
                  }
               }
               break;
            case RoomWidgetUserInfoUpdateEvent.const_105:
            case RoomWidgetUserInfoUpdateEvent.const_139:
               _loc4_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.storeUserInfo(_loc4_);
               this.updateView(_loc4_.webID,_loc4_.name,_loc4_.userRoomId,RoomObjectTypeEnum.const_129,false,!!_loc4_.isSpectatorMode ? null : this.var_222);
               break;
            case RoomWidgetUserInfoUpdateEvent.BOT:
               _loc5_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.updateView(_loc5_.webID,_loc5_.name,_loc5_.userRoomId,RoomObjectTypeEnum.const_562,false,null);
               break;
            case RoomWidgetPetInfoUpdateEvent.const_114:
               _loc6_ = param1 as RoomWidgetPetInfoUpdateEvent;
               this.updateView(_loc6_.id,_loc6_.name,_loc6_.roomIndex,RoomObjectTypeEnum.const_190,false,null);
               break;
            case RoomWidgetUserDataUpdateEvent.const_126:
               if(!this.var_198)
               {
                  this.getOwnCharacterInfo();
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_172:
               _loc7_ = param1 as RoomWidgetRoomObjectUpdateEvent;
               if(this._view && this._view.roomIndex == _loc7_.id)
               {
                  this.removeView(this._view,false);
               }
               for each(_loc8_ in this.var_345)
               {
                  if(_loc8_.objectId == _loc7_.id)
                  {
                     this.removeView(_loc8_,false);
                     break;
                  }
               }
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_93:
               this.var_1661 = false;
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_379:
               this.var_1661 = true;
         }
         this.checkUpdateNeed();
      }
      
      private function storeUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.var_222.amIAnyRoomController = param1.amIAnyRoomController;
         this.var_222.amIController = param1.amIController;
         this.var_222.amIOwner = param1.amIOwner;
         this.var_222.canBeAskedAsFriend = param1.canBeAskedAsFriend;
         this.var_222.canBeKicked = param1.canBeKicked;
         this.var_222.canTrade = param1.canTrade;
         this.var_222.canTradeReason = param1.canTradeReason;
         this.var_222.hasFlatControl = param1.hasFlatControl;
         this.var_222.isIgnored = param1.isIgnored;
         this.var_222.respectLeft = param1.respectLeft;
         this.var_222.isOwnUser = param1.type == RoomWidgetUserInfoUpdateEvent.const_105;
         this.var_222.allowNameChange = param1.allowNameChange;
      }
      
      private function updateView(param1:int, param2:String, param3:int, param4:int, param5:Boolean, param6:AvatarInfoData) : void
      {
         var _loc8_:* = null;
         var _loc7_:Boolean = false;
         if(param6)
         {
            _loc7_ = !!param6.isOwnUser ? Boolean(this.var_1660) : Boolean(this.var_2237);
         }
         if(_loc7_ && this._view && !(this._view is AvatarMenuView || this._view is OwnAvatarMenuView))
         {
            this.removeView(this._view,false);
         }
         if(this._view == null || this._view.userId != param1 || this._view.userName != param2 || this._view.roomIndex != param3 || this._view.userType != param4 || param5)
         {
            if(this._view)
            {
               this.removeView(this._view,false);
            }
            if(!this.var_1661)
            {
               if(_loc7_)
               {
                  if(param6.isOwnUser)
                  {
                     if(!this.var_721)
                     {
                        this.var_721 = new OwnAvatarMenuView(this);
                     }
                     this._view = this.var_721;
                     OwnAvatarMenuView.setup(this._view as OwnAvatarMenuView,param1,param2,param3,param4,param6);
                  }
                  else
                  {
                     if(!this.var_719)
                     {
                        this.var_719 = new AvatarMenuView(this);
                     }
                     this._view = this.var_719;
                     AvatarMenuView.setup(this._view as AvatarMenuView,param1,param2,param3,param4,param6);
                     for each(_loc8_ in this.var_345)
                     {
                        if(_loc8_.userId == param1)
                        {
                           this.removeView(_loc8_,false);
                           break;
                        }
                     }
                  }
               }
               else
               {
                  if(!this.var_720)
                  {
                     this.var_720 = new AvatarInfoView(this);
                  }
                  this._view = this.var_720;
                  AvatarInfoView.setup(this._view,param1,param2,param3,param4,param5);
               }
            }
         }
         else if(this._view is AvatarMenuView)
         {
            if(this._view.userName == param2)
            {
               this.removeView(this._view,false);
            }
         }
      }
      
      public function removeView(param1:AvatarInfoView, param2:Boolean) : void
      {
         if(param1)
         {
            if(this.var_2968)
            {
               param1.hide(param2);
            }
            else
            {
               param1.dispose();
               this.var_720 = null;
               this.var_719 = null;
               this.var_721 = null;
            }
            if(param1 == this._view)
            {
               this._view = null;
            }
            if(param1 is FriendNameView)
            {
               this.var_345.remove(param1.userName);
               param1.dispose();
               this.checkUpdateNeed();
            }
         }
      }
      
      private function showFriendName(param1:IUserData, param2:int) : void
      {
         var _loc3_:* = null;
         if(this.var_345[param1.name] == null)
         {
            _loc3_ = new FriendNameView(this);
            FriendNameView.setup(_loc3_,param1.webID,param1.name,-1,RoomObjectTypeEnum.const_129,param2);
            this.var_345[param1.name] = _loc3_;
            this.checkUpdateNeed();
         }
      }
      
      public function checkUpdateNeed() : void
      {
         if(!this.var_23)
         {
            return;
         }
         if(this._view || this.var_345.length > 0)
         {
            this.var_23.registerUpdateReceiver(this,10);
         }
         else
         {
            this.var_23.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._view)
         {
            _loc2_ = messageListener.processWidgetMessage(new RoomWidgetGetUserLocationMessage(this._view.userId,this._view.userType)) as RoomWidgetUserLocationUpdateEvent;
            if(!_loc2_)
            {
               return;
            }
            this._view.update(_loc2_.rectangle,_loc2_.screenLocation,param1);
         }
         for each(_loc3_ in this.var_345)
         {
            _loc2_ = messageListener.processWidgetMessage(new RoomWidgetGetUserLocationMessage(_loc3_.userId,_loc3_.userType)) as RoomWidgetUserLocationUpdateEvent;
            if(_loc2_)
            {
               _loc3_.update(_loc2_.rectangle,_loc2_.screenLocation,param1);
            }
         }
      }
      
      public function openAvatarInfo() : void
      {
         (handler as AvatarInfoWidgetHandler).avatarEditor.openEditor();
      }
   }
}
