package com.sulake.habbo.communication.messages.incoming.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementLevelUpData
   {
       
      
      private var _type:int;
      
      private var var_1112:int;
      
      private var var_1975:int;
      
      private var var_2360:int;
      
      private var var_1872:int;
      
      private var var_1503:int;
      
      private var var_310:int;
      
      private var var_2863:String = "";
      
      private var var_2865:String = "";
      
      private var var_2864:int;
      
      private var _category:String;
      
      public function AchievementLevelUpData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1112 = param1.readInteger();
         this.var_310 = param1.readInteger();
         this.var_2863 = param1.readString();
         this.var_1975 = param1.readInteger();
         this.var_2360 = param1.readInteger();
         this.var_1872 = param1.readInteger();
         this.var_1503 = param1.readInteger();
         this.var_2864 = param1.readInteger();
         this.var_2865 = param1.readString();
         this._category = param1.readString();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1112;
      }
      
      public function get points() : int
      {
         return this.var_1975;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2360;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1872;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1503;
      }
      
      public function get badgeId() : int
      {
         return this.var_310;
      }
      
      public function get badgeCode() : String
      {
         return this.var_2863;
      }
      
      public function get removedBadgeCode() : String
      {
         return this.var_2865;
      }
      
      public function get achievementID() : int
      {
         return this.var_2864;
      }
      
      public function get category() : String
      {
         return this._category;
      }
   }
}
