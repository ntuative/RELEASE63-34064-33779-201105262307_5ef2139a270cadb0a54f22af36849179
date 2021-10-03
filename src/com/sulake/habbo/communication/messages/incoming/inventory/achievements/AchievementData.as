package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1112:int;
      
      private var var_310:String;
      
      private var var_1722:int;
      
      private var var_2360:int;
      
      private var var_1872:int;
      
      private var var_1721:int;
      
      private var var_1720:Boolean;
      
      private var _category:String;
      
      private var var_2361:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1112 = param1.readInteger();
         this.var_310 = param1.readString();
         this.var_1722 = Math.max(1,param1.readInteger());
         this.var_2360 = param1.readInteger();
         this.var_1872 = param1.readInteger();
         this.var_1721 = param1.readInteger();
         this.var_1720 = param1.readBoolean();
         this._category = param1.readString();
         this.var_2361 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_310;
      }
      
      public function get level() : int
      {
         return this.var_1112;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_1722;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2360;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1872;
      }
      
      public function get currentPoints() : int
      {
         return this.var_1721;
      }
      
      public function get finalLevel() : Boolean
      {
         return this.var_1720;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get levelCount() : int
      {
         return this.var_2361;
      }
      
      public function get firstLevelAchieved() : Boolean
      {
         return this.var_1112 > 1 || this.var_1720;
      }
      
      public function setMaxProgress() : void
      {
         this.var_1721 = this.var_1722;
      }
   }
}
