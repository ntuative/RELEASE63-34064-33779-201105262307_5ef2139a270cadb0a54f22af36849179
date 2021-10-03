package com.sulake.habbo.session
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.availability.AvailabilityStatusMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.engine.UserChangeMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.pets.PetRespectFailedEvent;
   import com.sulake.habbo.communication.messages.incoming.users.UserNameChangedMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.room.chat.ChatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.pets.RespectPetMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.RespectUserMessageComposer;
   import com.sulake.habbo.communication.messages.parser.availability.AvailabilityStatusMessageParser;
   import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
   import com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.session.facebook.FaceBookSession;
   import com.sulake.habbo.session.furniture.FurnitureDataParser;
   import com.sulake.habbo.session.furniture.IFurniDataListener;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.session.product.IProductDataListener;
   import com.sulake.habbo.session.product.ProductDataParser;
   import com.sulake.habbo.utils.HabboWebTools;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class SessionDataManager extends Component implements ISessionDataManager
   {
       
      
      private var _communication:IHabboCommunicationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_16:IRoomSessionManager;
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_620:String;
      
      private var var_966:String;
      
      private var var_1825:String;
      
      private var var_2333:int = 0;
      
      private var var_1143:int = 0;
      
      private var _petRespectLeft:int = 0;
      
      private var var_2979:Array;
      
      private var var_1718:GroupDetailsView;
      
      private var var_2338:Boolean;
      
      private var var_2340:Boolean;
      
      private var var_1219:Dictionary;
      
      private var var_596:ProductDataParser;
      
      private var var_505:Map;
      
      private var _wallItems:Map;
      
      private var var_504:Map;
      
      private var var_298:FurnitureDataParser;
      
      private var var_1715:UserTagManager;
      
      private var var_1140:BadgeImageManager;
      
      private var var_1144:HabboGroupInfoManager;
      
      private var var_919:IgnoredUsersManager;
      
      private var var_195:IHabboConfigurationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var var_1717:Boolean = false;
      
      private var var_1141:Array;
      
      private var var_918:Array;
      
      private var var_2339:int;
      
      private var var_1716:int;
      
      private var var_2330:int;
      
      private var var_1142:FaceBookSession;
      
      public function SessionDataManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         this.var_2979 = [];
         this.var_1715 = new UserTagManager(events);
         this.var_1144 = new HabboGroupInfoManager(this,events);
         this.var_919 = new IgnoredUsersManager(this);
         this.var_1142 = new FaceBookSession();
         this.var_1219 = new Dictionary();
         this.var_1141 = [];
         this.var_918 = [];
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),this.onHabboCommunicationReady);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationReady);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationReady);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      override public function dispose() : void
      {
         if(this.var_505)
         {
            this.var_505.dispose();
            this.var_505 = null;
         }
         if(this.var_504)
         {
            this.var_504.dispose();
            this.var_504 = null;
         }
         if(this._communication)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_16)
         {
            this.var_16.release(new IIDHabboRoomSessionManager());
            this.var_16 = null;
         }
         if(this.var_195)
         {
            this.var_195.release(new IIDHabboConfigurationManager());
            this.var_195 = null;
         }
         if(this._localization)
         {
            this._localization.release(new IIDHabboLocalizationManager());
            this._localization = null;
         }
         this.var_918 = null;
         if(this.var_298)
         {
            this.var_298.removeEventListener(FurnitureDataParser.const_131,this.onFurnitureReady);
            this.var_298.dispose();
            this.var_298 = null;
         }
         if(this.var_596)
         {
            this.var_596.removeEventListener(ProductDataParser.const_131,this.onProductsReady);
            this.var_596.dispose();
            this.var_596 = null;
         }
         if(this.var_1142)
         {
            this.var_1142.dispose();
            this.var_1142 = null;
         }
         super.dispose();
      }
      
      private function initBadgeImageManager() : void
      {
         if(this.var_1140 != null)
         {
            return;
         }
         if(this.var_195 == null || this._localization == null)
         {
            return;
         }
         this.var_1140 = new BadgeImageManager(context.root.assets,events,this.var_195,this._localization);
      }
      
      private function onWindowManagerReady(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function onHabboCommunicationReady(param1:IID, param2:IUnknown) : void
      {
         this._communication = param2 as IHabboCommunicationManager;
         if(this._communication == null)
         {
            return;
         }
         this._communication.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this.onUserRights));
         this._communication.addHabboConnectionMessageEvent(new UserObjectEvent(this.onUserObject));
         this._communication.addHabboConnectionMessageEvent(new UserChangeMessageEvent(this.onUserChange));
         this._communication.addHabboConnectionMessageEvent(new UserNameChangedMessageEvent(this.onUserNameChange));
         this._communication.addHabboConnectionMessageEvent(new AvailabilityStatusMessageEvent(this.onAvailabilityStatus));
         this._communication.addHabboConnectionMessageEvent(new PetRespectFailedEvent(this.onPetRespectFailed));
         this._communication.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(this.onAuthenticationOK));
         this.var_1715.communication = this._communication;
         this.var_1144.communication = this._communication;
         this.var_1142.communication = this._communication;
         this.var_919.registerMessageEvents();
      }
      
      private function onConfigurationReady(param1:IID, param2:IUnknown) : void
      {
         var _loc3_:* = null;
         if(param2 == null)
         {
            return;
         }
         this.var_195 = param2 as IHabboConfigurationManager;
         this.initBadgeImageManager();
         if(!this.var_298)
         {
            this.var_505 = new Map();
            this._wallItems = new Map();
            this.var_504 = new Map();
            this.var_298 = new FurnitureDataParser(this.var_505,this._wallItems,this.var_504,this._localization);
            this.var_298.addEventListener(FurnitureDataParser.const_131,this.onFurnitureReady);
            if(this.var_195.keyExists("furnidata.load.url"))
            {
               _loc3_ = this.var_195.getKey("furnidata.load.url");
               this.var_298.loadData(_loc3_);
            }
         }
      }
      
      private function onLocalizationReady(param1:IID, param2:IUnknown) : void
      {
         if(param2 == null)
         {
            return;
         }
         this._localization = param2 as IHabboLocalizationManager;
         this.initBadgeImageManager();
         if(this.var_298)
         {
            this.var_298.localization = this._localization;
            this.var_298.registerFurnitureLocalizations();
         }
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_16 = param2 as IRoomSessionManager;
      }
      
      private function onFurnitureReady(param1:Event = null) : void
      {
         var _loc2_:* = null;
         this.var_298.removeEventListener(FurnitureDataParser.const_131,this.onFurnitureReady);
         for each(_loc2_ in this.var_918)
         {
            _loc2_.furniDataReady();
         }
         this.var_918 = [];
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         var _loc2_:UserRightsMessageEvent = UserRightsMessageEvent(param1);
         this.var_2339 = _loc2_.clubLevel;
         this.var_1716 = _loc2_.securityLevel;
      }
      
      private function onUserObject(param1:IMessageEvent) : void
      {
         var _loc2_:UserObjectEvent = param1 as UserObjectEvent;
         var _loc3_:UserObjectMessageParser = _loc2_.getParser();
         this._id = _loc3_.id;
         this._name = _loc3_.name;
         this.var_2333 = _loc3_.respectTotal;
         this.var_1143 = _loc3_.respectLeft;
         this._petRespectLeft = _loc3_.petRespectLeft;
         this.var_620 = _loc3_.figure;
         this.var_966 = _loc3_.sex;
         this.var_1825 = _loc3_.realName;
         this.var_2330 = _loc3_.identityId;
         this.var_919.initIgnoreList();
      }
      
      private function onUserChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserChangeMessageEvent = param1 as UserChangeMessageEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.id == -1)
         {
            this.var_620 = _loc2_.figure;
            this.var_966 = _loc2_.sex;
            events.dispatchEvent(new HabboSessionFigureUpdatedEvent(this._id,this.var_620,this.var_966));
         }
      }
      
      private function onUserNameChange(param1:IMessageEvent) : void
      {
         var _loc2_:UserNameChangedMessageEvent = param1 as UserNameChangedMessageEvent;
         if(_loc2_ == null || _loc2_.getParser() == null)
         {
            return;
         }
         var _loc3_:UserNameChangedMessageParser = _loc2_.getParser();
         if(_loc3_.webId == this._id)
         {
            this._name = _loc3_.newName;
         }
      }
      
      private function onAvailabilityStatus(param1:IMessageEvent) : void
      {
         var _loc2_:AvailabilityStatusMessageParser = (param1 as AvailabilityStatusMessageEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_2338 = _loc2_.isOpen;
         this.var_2340 = _loc2_.onShutDown;
      }
      
      private function onPetRespectFailed(param1:PetRespectFailedEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         ++this._petRespectLeft;
      }
      
      private function onAuthenticationOK(param1:IMessageEvent) : void
      {
         this.loadProductData();
      }
      
      public function get systemOpen() : Boolean
      {
         return this.var_2338;
      }
      
      public function get systemShutDown() : Boolean
      {
         return this.var_2340;
      }
      
      public function hasSecurity(param1:int) : Boolean
      {
         return this.var_1716 >= param1;
      }
      
      public function hasUserRight(param1:String, param2:int) : Boolean
      {
         return this.var_2339 >= param2;
      }
      
      public function get userId() : int
      {
         return this._id;
      }
      
      public function get identityId() : int
      {
         return this.var_2330;
      }
      
      public function get userName() : String
      {
         return this._name;
      }
      
      public function get realName() : String
      {
         return this.var_1825;
      }
      
      public function get figure() : String
      {
         return this.var_620;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         return this.var_1716 >= SecurityLevelEnum.const_1336;
      }
      
      public function getUserTags(param1:int) : Array
      {
         return this.var_1715.getTags(param1);
      }
      
      public function getBadgeImage(param1:String) : BitmapData
      {
         return this.var_1140.getBadgeImage(param1);
      }
      
      public function getBadgeImageWithInfo(param1:String) : BadgeInfo
      {
         return this.var_1140.getBadgeImageWithInfo(param1);
      }
      
      public function showGroupBadgeInfo(param1:int) : void
      {
         if(this.var_1718 == null)
         {
            this.var_1718 = new GroupDetailsView(this);
         }
         var _loc2_:HabboGroupDetails = this.var_1144.getGroupDetails(param1);
         if(_loc2_ != null)
         {
            this.var_1718.showGroupDetails(param1);
         }
      }
      
      public function getGroupDetails(param1:int) : HabboGroupDetails
      {
         return this.var_1144.getGroupDetails(param1);
      }
      
      public function getGroupBadgeId(param1:int) : String
      {
         return this.var_1144.getBadgeId(param1);
      }
      
      public function getGroupBadgeImage(param1:String) : BitmapData
      {
         return this.var_1140.getBadgeImage(param1,BadgeImageManager.const_1225);
      }
      
      public function get communication() : IHabboCommunicationManager
      {
         return this._communication;
      }
      
      public function isIgnored(param1:String) : Boolean
      {
         return this.var_919.isIgnored(param1);
      }
      
      public function ignoreUser(param1:String) : void
      {
         this.var_919.ignoreUser(param1);
      }
      
      public function unignoreUser(param1:String) : void
      {
         this.var_919.unignoreUser(param1);
      }
      
      public function get respectLeft() : int
      {
         return this.var_1143;
      }
      
      public function get petRespectLeft() : int
      {
         return this._petRespectLeft;
      }
      
      public function giveRespect(param1:int) : void
      {
         var _loc2_:IConnection = this._communication.getHabboMainConnection(null);
         if(param1 < 0 || this.var_1143 < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to user: " + param1);
         }
         _loc2_.send(new RespectUserMessageComposer(param1));
         this.var_1143 = this.var_1143 - 1;
      }
      
      public function givePetRespect(param1:int) : void
      {
         var _loc2_:IConnection = this._communication.getHabboMainConnection(null);
         if(param1 < 0 || this._petRespectLeft < 1 || _loc2_ == null)
         {
            throw new Error("Failed to give respect to pet: " + param1);
         }
         _loc2_.send(new RespectPetMessageComposer(param1));
         this._petRespectLeft = this._petRespectLeft - 1;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_195;
      }
      
      public function getProductData(param1:String) : IProductData
      {
         if(!this.var_1717)
         {
            this.loadProductData();
         }
         return this.var_1219[param1];
      }
      
      public function getFloorItemData(param1:int) : IFurnitureData
      {
         if(this.var_505 == null)
         {
            return null;
         }
         return this.var_505.getValue(param1.toString());
      }
      
      public function getWallItemData(param1:int) : IFurnitureData
      {
         if(this._wallItems == null)
         {
            return null;
         }
         return this._wallItems.getValue(param1.toString());
      }
      
      public function getFloorItemDataByName(param1:String, param2:int = 0) : IFurnitureData
      {
         var _loc4_:int = 0;
         if(this.var_504 == null)
         {
            return null;
         }
         var _loc3_:Array = this.var_504.getValue(param1);
         if(_loc3_ != null && param2 <= _loc3_.length - 1)
         {
            _loc4_ = _loc3_[param2];
            return this.getFloorItemData(_loc4_);
         }
         return null;
      }
      
      public function getWallItemDataByName(param1:String, param2:int = 0) : IFurnitureData
      {
         var _loc4_:int = 0;
         if(this.var_504 == null)
         {
            return null;
         }
         var _loc3_:Array = this.var_504.getValue(param1);
         if(_loc3_ != null && param2 <= _loc3_.length - 1)
         {
            _loc4_ = _loc3_[param2];
            return this.getWallItemData(_loc4_);
         }
         return null;
      }
      
      public function openHabboHomePage(param1:int) : void
      {
         var urlString:String = null;
         var userId:int = param1;
         if(this.var_195 != null)
         {
            urlString = this.var_195.getKey("link.format.userpage");
            urlString = urlString.replace("%ID%",String(userId));
            try
            {
               HabboWebTools.navigateToURL(urlString,"habboMain");
            }
            catch(e:Error)
            {
               Logger.log("Error occurred!");
            }
         }
      }
      
      public function pickAllFurniture(param1:int, param2:int) : void
      {
         var roomId:int = param1;
         var roomCategory:int = param2;
         if(this.var_16 == null || this._windowManager == null)
         {
            return;
         }
         var session:IRoomSession = this.var_16.getSession(roomId,roomCategory);
         if(session == null)
         {
            return;
         }
         if(session.isRoomOwner || this.isAnyRoomController)
         {
            this._windowManager.confirm("${generic.alert.title}","${room.confirm.pick_all}",0,function(param1:IConfirmDialog, param2:WindowEvent):void
            {
               param1.dispose();
               if(param2.type == WindowEvent.const_182)
               {
                  sendPickAllFurnitureMessage();
               }
            });
         }
      }
      
      public function loadProductData(param1:IProductDataListener = null) : Boolean
      {
         var _loc2_:* = null;
         if(this.var_1717)
         {
            return true;
         }
         if(param1 && this.var_1141.indexOf(param1) == -1)
         {
            this.var_1141.push(param1);
         }
         if(!this.var_195)
         {
            return false;
         }
         if(this.var_596 == null)
         {
            _loc2_ = this.var_195.getKey("productdata.load.url");
            this.var_596 = new ProductDataParser(_loc2_,this.var_1219);
            this.var_596.addEventListener(ProductDataParser.const_131,this.onProductsReady);
         }
         return false;
      }
      
      private function onProductsReady(param1:Event) : void
      {
         var _loc2_:* = null;
         this.var_596.removeEventListener(ProductDataParser.const_131,this.onProductsReady);
         this.var_1717 = true;
         for each(_loc2_ in this.var_1141)
         {
            if(_loc2_ != null && !_loc2_.disposed)
            {
               _loc2_.productDataReady();
            }
         }
         this.var_1141 = [];
      }
      
      private function sendPickAllFurnitureMessage() : void
      {
         var _loc1_:IConnection = this._communication.getHabboMainConnection(null);
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.send(new ChatMessageComposer(":pickall"));
      }
      
      public function get roomSessionManager() : IRoomSessionManager
      {
         return this.var_16;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get gender() : String
      {
         return this.var_966;
      }
      
      public function getFurniData(param1:IFurniDataListener) : Array
      {
         if(this.var_505.length == 0)
         {
            if(this.var_918.indexOf(param1) == -1)
            {
               this.var_918.push(param1);
            }
            return null;
         }
         var _loc2_:Array = this.var_505.getValues();
         return _loc2_.concat(this._wallItems.getValues());
      }
   }
}
