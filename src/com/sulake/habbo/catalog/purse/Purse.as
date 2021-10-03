package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
       
      
      private var var_1699:int = 0;
      
      private var var_1471:Dictionary;
      
      private var var_1822:int = 0;
      
      private var var_1823:int = 0;
      
      private var var_2446:Boolean = false;
      
      private var var_2509:int = 0;
      
      private var var_2510:int = 0;
      
      public function Purse()
      {
         this.var_1471 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_1699;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_1699 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1822;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1822 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1823;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1823 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1822 > 0 || this.var_1823 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2446;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2446 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2509;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2509 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2510;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2510 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1471;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1471 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1471[param1];
      }
   }
}
