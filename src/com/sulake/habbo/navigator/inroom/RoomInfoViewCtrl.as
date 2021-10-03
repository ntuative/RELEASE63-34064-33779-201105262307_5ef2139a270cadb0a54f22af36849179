package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.ToggleStaffPickMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboNavigatorEvent;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.utils.HabboWebTools;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var _window:IWindowContainer;
      
      private var var_189:IWindowContainer;
      
      private var var_2992:int;
      
      private var var_397:RoomEventViewCtrl;
      
      private var var_396:Timer;
      
      private var var_149:RoomSettingsCtrl;
      
      private var var_281:RoomThumbnailCtrl;
      
      private var var_1073:TagRenderer;
      
      private var var_395:IWindowContainer;
      
      private var var_398:IWindowContainer;
      
      private var var_679:IWindowContainer;
      
      private var var_2054:IWindowContainer;
      
      private var var_2053:IWindowContainer;
      
      private var var_1319:IWindowContainer;
      
      private var var_955:ITextWindow;
      
      private var var_1070:ITextWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_851:ITextWindow;
      
      private var var_1318:ITextWindow;
      
      private var var_1071:ITextWindow;
      
      private var var_849:ITextWindow;
      
      private var var_1594:ITextWindow;
      
      private var var_280:IWindowContainer;
      
      private var var_847:IWindowContainer;
      
      private var var_1591:IWindowContainer;
      
      private var var_2052:ITextWindow;
      
      private var var_680:ITextWindow;
      
      private var var_2051:IWindow;
      
      private var var_1320:IContainerButtonWindow;
      
      private var var_1317:IContainerButtonWindow;
      
      private var var_1316:IContainerButtonWindow;
      
      private var _remFavouriteButton:IContainerButtonWindow;
      
      private var var_1322:IContainerButtonWindow;
      
      private var var_1595:IButtonWindow;
      
      private var var_1593:IButtonWindow;
      
      private var var_1596:IButtonWindow;
      
      private var var_850:IWindowContainer;
      
      private var var_1321:ITextWindow;
      
      private var var_1072:ITextFieldWindow;
      
      private var _buttons:IWindowContainer;
      
      private var var_848:IButtonWindow;
      
      private var var_1592:Boolean = false;
      
      private const const_825:int = 75;
      
      private const const_964:int = 3;
      
      private const const_868:int = 45;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_397 = new RoomEventViewCtrl(this._navigator);
         this.var_149 = new RoomSettingsCtrl(this._navigator,this,true);
         this.var_281 = new RoomThumbnailCtrl(this._navigator);
         this.var_1073 = new TagRenderer(this._navigator);
         this._navigator.roomSettingsCtrls.push(this.var_149);
         this.var_396 = new Timer(6000,1);
         this.var_396.addEventListener(TimerEvent.TIMER,this.hideInfo);
      }
      
      public function dispose() : void
      {
         if(this.var_396)
         {
            this.var_396.removeEventListener(TimerEvent.TIMER,this.hideInfo);
            this.var_396.reset();
            this.var_396 = null;
         }
         this._navigator = null;
         this.var_397 = null;
         this.var_149 = null;
         this.var_281 = null;
         if(this.var_1073)
         {
            this.var_1073.dispose();
            this.var_1073 = null;
         }
         this.var_189 = null;
         this.var_395 = null;
         this.var_398 = null;
         this.var_679 = null;
         this.var_2054 = null;
         this.var_2053 = null;
         this.var_1319 = null;
         this.var_955 = null;
         this.var_1070 = null;
         this._ownerName = null;
         this.var_851 = null;
         this.var_1318 = null;
         this.var_1071 = null;
         this.var_849 = null;
         this.var_1594 = null;
         this.var_280 = null;
         this.var_847 = null;
         this.var_1591 = null;
         this.var_2052 = null;
         this.var_680 = null;
         this.var_2051 = null;
         this.var_1320 = null;
         this.var_1317 = null;
         this.var_1316 = null;
         this._remFavouriteButton = null;
         this.var_1322 = null;
         this.var_1595 = null;
         this.var_1593 = null;
         this.var_1596 = null;
         this.var_850 = null;
         this.var_1321 = null;
         this.var_1072 = null;
         this._buttons = null;
         this.var_848 = null;
         if(this._window)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         this.refresh();
      }
      
      public function startEventEdit() : void
      {
         this.var_396.reset();
         this.var_397.active = true;
         this.var_149.active = false;
         this.var_281.active = false;
         this.reload();
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this.var_396.reset();
         this.var_149.load(param1);
         this.var_149.active = true;
         this.var_397.active = false;
         this.var_281.active = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function backToRoomSettings() : void
      {
         this.var_149.active = true;
         this.var_397.active = false;
         this.var_281.active = false;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this.var_396.reset();
         this.var_149.active = false;
         this.var_397.active = false;
         this.var_281.active = true;
         this.reload();
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      public function close() : void
      {
         if(this._window == null)
         {
            return;
         }
         this._window.visible = false;
         this.var_1592 = false;
         this._navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      public function reload() : void
      {
         if(this._window != null && this._window.visible)
         {
            this.refresh();
         }
      }
      
      public function toggle() : void
      {
         this.var_396.reset();
         this.var_397.active = false;
         this.var_149.active = false;
         this.var_281.active = false;
         this.refresh();
         this._window.visible = !this._window.visible;
         this._window.x = this._window.desktop.width - this._window.width - this.const_964;
         this._window.y = this.const_825;
         if(this._window.visible)
         {
            this._window.activate();
         }
      }
      
      private function refresh() : void
      {
         this.prepareWindow();
         this.refreshRoom();
         this.refreshEvent();
         this.refreshEmbed();
         this.refreshButtons();
         Util.moveChildrenToColumn(this.var_189,["room_info","event_info","embed_info","buttons_container"],0,2);
         this.var_189.height = Util.getLowestPoint(this.var_189);
         var _loc1_:int = this._window.desktop.height - this._window.height - this.const_868;
         if(this._window.y > _loc1_)
         {
            this._window.y = _loc1_ < 0 ? 0 : int(_loc1_);
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(this.var_395);
         var _loc1_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _loc1_ != null && _loc1_.flatId == this._navigator.data.homeRoomId;
         this.refreshRoomDetails(_loc1_,_loc2_);
         this.refreshPublicSpaceDetails(this._navigator.data.enteredPublicSpace);
         this.refreshRoomButtons(_loc2_);
         this.var_149.refresh(this.var_395);
         this.var_281.refresh(this.var_395);
         Util.moveChildrenToColumn(this.var_395,["room_details","room_buttons"],0,2);
         this.var_395.height = Util.getLowestPoint(this.var_395);
         this.var_395.visible = true;
         Logger.log("XORP: " + this.var_398.visible + ", " + this.var_1319.visible + ", " + this.var_679.visible + ", " + this.var_679.rectangle + ", " + this.var_395.rectangle);
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(this.var_280);
         var _loc1_:RoomEventData = this._navigator.data.roomEventData;
         this.refreshEventDetails(_loc1_);
         this.refreshEventButtons(_loc1_);
         this.var_397.refresh(this.var_280);
         if(Util.hasVisibleChildren(this.var_280) && !(this.var_149.active || this.var_281.active))
         {
            Util.moveChildrenToColumn(this.var_280,["event_details","event_buttons"],0,2);
            this.var_280.height = Util.getLowestPoint(this.var_280);
            this.var_280.visible = true;
         }
         else
         {
            this.var_280.visible = false;
         }
         Logger.log("EVENT: " + this.var_280.visible + ", " + this.var_280.rectangle);
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = this._navigator.configuration.getKey("embed.showInRoomInfo","ToggleToRandomState") == "true";
         var _loc2_:* = this._navigator.data.enteredGuestRoom != null;
         if(_loc2_ && _loc1_ && !this.var_149.active && !this.var_281.active && !this.var_397.active)
         {
            this.var_850.visible = true;
            this.var_1072.text = this.getEmbedData();
         }
         else
         {
            this.var_850.visible = false;
         }
      }
      
      private function refreshButtons() : void
      {
         var _loc1_:* = false;
         if(!this._buttons)
         {
            return;
         }
         if(this.var_149.active)
         {
            this._buttons.visible = false;
            return;
         }
         this._buttons.visible = true;
         if(this.var_848)
         {
            _loc1_ = this._navigator.data.enteredGuestRoom != null;
            this.var_848.visible = _loc1_;
            if(this.var_1592)
            {
               this.var_848.caption = "${navigator.zoom.in}";
            }
            else
            {
               this.var_848.caption = "${navigator.zoom.out}";
            }
         }
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || this.var_149.active || this.var_281.active)
         {
            return;
         }
         this.var_955.text = param1.roomName;
         this.var_955.height = this.var_955.textHeight + 5;
         this._ownerName.text = param1.ownerName;
         this.var_851.text = param1.description;
         this.var_1073.refreshTags(this.var_398,param1.tags);
         this.var_851.visible = false;
         if(param1.description != "")
         {
            this.var_851.height = this.var_851.textHeight + 5;
            this.var_851.visible = true;
         }
         var _loc3_:Boolean = Boolean(this._navigator.configuration.getKey("client.allow.facebook.like") == "1");
         this._navigator.refreshButton(this.var_1317,"facebook_logo_small",_loc3_,null,0);
         this.var_1317.visible = _loc3_;
         var _loc4_:* = this._navigator.data.currentRoomRating == -1;
         this._navigator.refreshButton(this.var_1320,"thumb_up",_loc4_,null,0);
         this.var_1320.visible = _loc4_;
         this.var_849.visible = !_loc4_;
         this.var_1594.visible = !_loc4_;
         this.var_1594.text = "" + this._navigator.data.currentRoomRating;
         this.refreshStuffPick();
         this._navigator.refreshButton(this.var_398,"home",param2,null,0);
         this._navigator.refreshButton(this.var_398,"favourite",!param2 && this._navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(this.var_398,["room_name","owner_name_cont","tags","room_desc","rating_cont","staff_pick_button"],this.var_955.y,0);
         this.var_398.visible = true;
         this.var_398.height = Util.getLowestPoint(this.var_398);
      }
      
      private function refreshStuffPick() : void
      {
         var _loc1_:IWindow = this.var_398.findChildByName("staff_pick_button");
         if(!this._navigator.data.roomPicker)
         {
            _loc1_.visible = false;
            return;
         }
         _loc1_.visible = true;
         _loc1_.caption = this._navigator.getText(!!this._navigator.data.currentRoomIsStaffPick ? "navigator.staffpicks.unpick" : "navigator.staffpicks.pick");
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || this.var_149.active || this.var_281.active)
         {
            return;
         }
         this.var_1070.text = this._navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         this.var_1070.height = this.var_1070.textHeight + 5;
         this.var_1318.text = this._navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         this.var_1318.height = this.var_1318.textHeight + 5;
         Util.moveChildrenToColumn(this.var_679,["public_space_name","public_space_desc"],this.var_1070.y,0);
         this.var_679.visible = true;
         this.var_679.height = Math.max(86,Util.getLowestPoint(this.var_679));
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || this.var_397.active)
         {
            return;
         }
         this.var_2052.text = param1.eventName;
         this.var_680.text = param1.eventDescription;
         this.var_1073.refreshTags(this.var_847,[this._navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         this.var_680.visible = false;
         if(param1.eventDescription != "")
         {
            this.var_680.height = this.var_680.textHeight + 5;
            this.var_680.y = Util.getLowestPoint(this.var_847) + 2;
            this.var_680.visible = true;
         }
         this.var_847.visible = true;
         this.var_847.height = Util.getLowestPoint(this.var_847);
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(this._navigator.data.enteredGuestRoom == null || this.var_149.active || this.var_281.active)
         {
            return;
         }
         this.var_1595.visible = this._navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = this._navigator.data.isCurrentRoomFavourite();
         this.var_1316.visible = this._navigator.data.canAddFavourite && !_loc2_;
         this._remFavouriteButton.visible = this._navigator.data.canAddFavourite && _loc2_;
         this.var_1322.visible = this._navigator.data.canEditRoomSettings && !param1;
         this.var_1319.visible = Util.hasVisibleChildren(this.var_1319);
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(this.var_397.active)
         {
            return;
         }
         this.var_1593.visible = param1 == null && this._navigator.data.currentRoomOwner;
         this.var_1596.visible = param1 != null && (this._navigator.data.currentRoomOwner || this._navigator.data.eventMod);
         this.var_1591.visible = Util.hasVisibleChildren(this.var_1591);
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            return;
         }
         this._window = IWindowContainer(this._navigator.getXmlWindow("iro_room_details_framed"));
         this.var_189 = this._window.findChildByName("content") as IWindowContainer;
         this._window.visible = false;
         this.var_395 = IWindowContainer(this.find("room_info"));
         this.var_398 = IWindowContainer(this.find("room_details"));
         this.var_679 = IWindowContainer(this.find("public_space_details"));
         this.var_2054 = IWindowContainer(this.find("owner_name_cont"));
         this.var_2053 = IWindowContainer(this.find("rating_cont"));
         this.var_1319 = IWindowContainer(this.find("room_buttons"));
         this.var_955 = ITextWindow(this.find("room_name"));
         this.var_1070 = ITextWindow(this.find("public_space_name"));
         this._ownerName = ITextWindow(this.find("owner_name"));
         this.var_851 = ITextWindow(this.find("room_desc"));
         this.var_1318 = ITextWindow(this.find("public_space_desc"));
         this.var_1071 = ITextWindow(this.find("owner_caption"));
         this.var_849 = ITextWindow(this.find("rating_caption"));
         this.var_1594 = ITextWindow(this.find("rating_txt"));
         this.var_280 = IWindowContainer(this.find("event_info"));
         this.var_847 = IWindowContainer(this.find("event_details"));
         this.var_1591 = IWindowContainer(this.find("event_buttons"));
         this.var_2052 = ITextWindow(this.find("event_name"));
         this.var_680 = ITextWindow(this.find("event_desc"));
         this.var_1317 = IContainerButtonWindow(this.find("facebook_like_button"));
         this.var_1320 = IContainerButtonWindow(this.find("rate_up_button"));
         this.var_2051 = this.find("staff_pick_button");
         this.var_1316 = IContainerButtonWindow(this.find("add_favourite_button"));
         this._remFavouriteButton = IContainerButtonWindow(this.find("rem_favourite_button"));
         this.var_1322 = IContainerButtonWindow(this.find("make_home_button"));
         this.var_1595 = IButtonWindow(this.find("room_settings_button"));
         this.var_1593 = IButtonWindow(this.find("create_event_button"));
         this.var_1596 = IButtonWindow(this.find("edit_event_button"));
         this.var_850 = IWindowContainer(this.find("embed_info"));
         this.var_1321 = ITextWindow(this.find("embed_info_txt"));
         this.var_1072 = ITextFieldWindow(this.find("embed_src_txt"));
         this._buttons = IWindowContainer(this.find("buttons_container"));
         this.var_848 = IButtonWindow(this.find("zoom_button"));
         this.addMouseClickListener(this.var_1316,this.onAddFavouriteClick);
         this.addMouseClickListener(this._remFavouriteButton,this.onRemoveFavouriteClick);
         this.addMouseClickListener(this.var_1595,this.onRoomSettingsClick);
         this.addMouseClickListener(this.var_1322,this.onMakeHomeClick);
         this.addMouseClickListener(this.var_1593,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_1596,this.onEventSettingsClick);
         this.addMouseClickListener(this.var_1072,this.onEmbedSrcClick);
         this.addMouseClickListener(this.var_1320,this.onThumbUp);
         this.addMouseClickListener(this.var_2051,this.onStaffPick);
         this.addMouseClickListener(this.var_1317,this.onFacebookLike);
         this.addMouseClickListener(this.var_848,this.onZoomClick);
         this._navigator.refreshButton(this.var_1316,"favourite",true,null,0);
         this._navigator.refreshButton(this._remFavouriteButton,"favourite",true,null,0);
         this._navigator.refreshButton(this.var_1322,"home",true,null,0);
         this.addMouseClickListener(this._window.findChildByTag("close"),this.onCloseButtonClick);
         this.addMouseOverListener(this.var_395,this.onHover);
         this.addMouseOverListener(this.var_280,this.onHover);
         this.var_1071.width = this.var_1071.textWidth;
         Util.moveChildrenToRow(this.var_2054,["owner_caption","owner_name"],this.var_1071.x,this.var_1071.y,3);
         this.var_849.width = this.var_849.textWidth;
         Util.moveChildrenToRow(this.var_2053,["rating_caption","rating_txt"],this.var_849.x,this.var_849.y,3);
         this.var_1321.height = this.var_1321.textHeight + 5;
         Util.moveChildrenToColumn(this.var_850,["embed_info_txt","embed_src_txt"],this.var_1321.y,2);
         this.var_850.height = Util.getLowestPoint(this.var_850) + 5;
         this.var_2992 = this._window.y + this._window.height;
      }
      
      private function addMouseClickListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,param2);
         }
      }
      
      private function addMouseOverListener(param1:IWindow, param2:Function) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,param2);
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = this._window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent) : void
      {
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(this._navigator.data.isFavouritesFull())
         {
            _loc2_ = new SimpleAlertView(this._navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc2_.show();
         }
         else
         {
            this._navigator.send(new AddFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         this._navigator.send(new DeleteFavouriteRoomMessageComposer(this._navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onEventSettingsClick(param1:WindowEvent) : void
      {
         if(this._navigator.data.roomEventData == null)
         {
            if(this._navigator.data.currentRoomOwner)
            {
               this._navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            this.startEventEdit();
         }
      }
      
      private function onRoomSettingsClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         this.startRoomSettingsEdit(_loc2_.flatId);
      }
      
      private function onMakeHomeClick(param1:WindowEvent) : void
      {
         var _loc2_:GuestRoomData = this._navigator.data.enteredGuestRoom;
         if(_loc2_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc2_.flatId);
         this._navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc2_.flatId));
      }
      
      private function onCloseButtonClick(param1:WindowEvent) : void
      {
         this.hideInfo(null);
      }
      
      private function onThumbUp(param1:WindowEvent) : void
      {
         this._navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function onStaffPick(param1:WindowEvent) : void
      {
         this._navigator.send(new ToggleStaffPickMessageComposer(this._navigator.data.enteredGuestRoom.flatId,this._navigator.data.currentRoomIsStaffPick));
      }
      
      private function onFacebookLike(param1:WindowEvent) : void
      {
         HabboWebTools.facebookLike(this._navigator.data.enteredGuestRoom.flatId);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent) : void
      {
         this.var_1072.setSelection(0,this.var_1072.text.length);
      }
      
      private function onZoomClick(param1:WindowEvent) : void
      {
         this._navigator.events.dispatchEvent(new HabboNavigatorEvent(HabboNavigatorEvent.ZOOM_TOGGLE));
         this.var_1592 = !this.var_1592;
         this.refreshButtons();
      }
      
      private function onHover(param1:WindowEvent) : void
      {
         this.var_396.reset();
      }
      
      private function hideInfo(param1:Event) : void
      {
         this._window.visible = false;
         if(this.var_149 != null)
         {
            this.var_149.resetView();
         }
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(this._navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + this._navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + this._navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = this._navigator.configuration.getKey("user.hash","");
         this._navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         this._navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         this._navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return this._navigator.getText("navigator.embed.src");
      }
   }
}
