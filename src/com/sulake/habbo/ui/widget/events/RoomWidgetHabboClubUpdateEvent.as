package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_296:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2802:int = 0;
      
      private var var_2801:int = 0;
      
      private var var_2800:int = 0;
      
      private var var_2803:Boolean = false;
      
      private var var_2339:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_296,param6,param7);
         this.var_2802 = param1;
         this.var_2801 = param2;
         this.var_2800 = param3;
         this.var_2803 = param4;
         this.var_2339 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2802;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2801;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2800;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2803;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2339;
      }
   }
}
