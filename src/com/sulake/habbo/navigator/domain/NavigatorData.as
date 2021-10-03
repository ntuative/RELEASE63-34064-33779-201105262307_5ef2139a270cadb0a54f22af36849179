package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1990:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_213:MsgWithRequestId;
      
      private var var_667:RoomEventData;
      
      private var var_2769:Boolean;
      
      private var var_2766:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2649:int;
      
      private var var_271:GuestRoomData;
      
      private var var_1058:PublicRoomShortData;
      
      private var var_2763:int;
      
      private var var_2771:Boolean;
      
      private var var_2761:int;
      
      private var var_2764:Boolean;
      
      private var var_1992:int;
      
      private var var_2770:Boolean;
      
      private var var_1560:Array;
      
      private var var_1561:Array;
      
      private var var_2762:int;
      
      private var var_1559:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1282:Boolean;
      
      private var var_2768:int;
      
      private var var_2765:Boolean;
      
      private var var_2767:int = 0;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1560 = new Array();
         this.var_1561 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_271 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_271 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_1058 = null;
         this.var_271 = null;
         this._currentRoomOwner = false;
         if(param1.privateRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_1058 = param1.publicSpace;
            this.var_667 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_667 != null)
         {
            this.var_667.dispose();
            this.var_667 = null;
         }
         if(this.var_1058 != null)
         {
            this.var_1058.dispose();
            this.var_1058 = null;
         }
         if(this.var_271 != null)
         {
            this.var_271.dispose();
            this.var_271 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_271 != null)
         {
            this.var_271.dispose();
         }
         this.var_271 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_667 != null)
         {
            this.var_667.dispose();
         }
         this.var_667 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_213 != null && this.var_213 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_213 != null && this.var_213 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_213 != null && this.var_213 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_213 = param1;
         this.var_1282 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_213 = param1;
         this.var_1282 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_213 = param1;
         this.var_1282 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_213 == null)
         {
            return;
         }
         this.var_213.dispose();
         this.var_213 = null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_213 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_213 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_213 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_667;
      }
      
      public function get avatarId() : int
      {
         return this.var_2649;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2769;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2766;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_271;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_1058;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2771;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2761;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1992;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2764;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2768;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2763;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2770;
      }
      
      public function get adIndex() : int
      {
         return this.var_2767;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2765;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2649 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2761 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2771 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2769 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2766 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2764 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1992 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2768 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2763 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2770 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2767 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2765 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1560 = param1;
         this.var_1561 = new Array();
         for each(_loc2_ in this.var_1560)
         {
            if(_loc2_.visible)
            {
               this.var_1561.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1560;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1561;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2762 = param1.limit;
         this.var_1559 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1559 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_271.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_271 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_271.flatId;
         return this.var_1992 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1559 >= this.var_2762;
      }
      
      public function startLoading() : void
      {
         this.var_1282 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1282;
      }
   }
}
