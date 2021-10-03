package com.sulake.habbo.room.events
{
   public class RoomEngineObjectEvent extends RoomEngineEvent
   {
      
      public static const const_783:String = "REOE_OBJECT_SELECTED";
      
      public static const const_502:String = "REOE_OBJECT_DESELECTED";
      
      public static const const_256:String = "REOB_OBJECT_ADDED";
      
      public static const const_411:String = "REOE_OBJECT_REMOVED";
      
      public static const const_160:String = "REOB_OBJECT_PLACED";
      
      public static const const_954:String = "REOB_OBJECT_REQUEST_MOVE";
      
      public static const const_179:String = "REOB_OBJECT_MOUSE_ENTER";
      
      public static const const_183:String = "REOB_OBJECT_MOUSE_LEAVE";
      
      public static const const_168:String = "REOE_WIDGET_REQUEST_PLACEHOLDER";
      
      public static const ROOM_OBJECT_WIDGET_REQUEST_CREDITFURNI:String = "REOE_WIDGET_REQUEST_CREDITFURNI";
      
      public static const const_162:String = "REOE_WIDGET_REQUEST_STICKIE";
      
      public static const const_154:String = "REOE_WIDGET_REQUEST_PRESENT";
      
      public static const const_149:String = "REOE_WIDGET_REQUEST_TROPHY";
      
      public static const const_159:String = "REOE_WIDGET_REQUEST_TEASER";
      
      public static const const_169:String = "REOE_WIDGET_REQUEST_ECOTRONBOX";
      
      public static const const_150:String = "REOE_WIDGET_REQUEST_DIMMER";
      
      public static const const_108:String = "REOR_REMOVE_DIMMER";
      
      public static const const_151:String = "REOR_REQUEST_CLOTHING_CHANGE";
      
      public static const const_158:String = "REOR_WIDGET_REQUEST_PLAYLIST_EDITOR";
      
      public static const const_518:String = "REOE_ROOM_AD_FURNI_CLICK";
      
      public static const const_503:String = "REOE_ROOM_AD_FURNI_DOUBLE_CLICK";
      
      public static const const_508:String = "REOE_ROOM_AD_TOOLTIP_SHOW";
      
      public static const const_611:String = "REOE_ROOM_AD_TOOLTIP_HIDE";
       
      
      private var var_219:int;
      
      private var _category:int;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      public function RoomEngineObjectEvent(param1:String, param2:int, param3:int, param4:int, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param2,param3,param6,param7);
         this.var_219 = param4;
         this._category = param5;
      }
      
      public function get objectId() : int
      {
         return this.var_219;
      }
      
      public function get category() : int
      {
         return this._category;
      }
   }
}
