package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetClothingChangeUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_383:String = "RWCCUE_SHOW_GENDER_SELECTION";
      
      public static const const_1162:String = "RWCCUE_SHOW_CLOTHING_EDITOR";
      
      public static const const_409:String = "RWCCUE_HIDE_CLOTHING_EDITOR";
       
      
      private var var_219:int = -1;
      
      private var var_2523:int = -1;
      
      private var _roomId:int = -1;
      
      private var _roomCategory:int = -1;
      
      public function RoomWidgetClothingChangeUpdateEvent(param1:String, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_219 = param2;
         this.var_2523 = param3;
         this._roomId = param4;
         this._roomCategory = param5;
      }
      
      public function get objectId() : int
      {
         return this.var_219;
      }
      
      public function get objectCategory() : int
      {
         return this.var_2523;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
   }
}
