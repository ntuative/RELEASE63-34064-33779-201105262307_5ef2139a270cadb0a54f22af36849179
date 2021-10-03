package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_2058:String;
      
      private var var_2859:int;
      
      private var var_2860:int;
      
      private var var_1687:int;
      
      private var _id:int;
      
      private var var_2057:Boolean;
      
      private var _type:String;
      
      private var var_2059:String;
      
      private var var_2056:int;
      
      private var _localizationCode:String;
      
      private var var_2862:int;
      
      private var var_2858:int;
      
      private var var_2861:int;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2058 = param1.readString();
         this.var_2859 = param1.readInteger();
         this.var_2860 = param1.readInteger();
         this.var_1687 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_2057 = param1.readBoolean();
         this._type = param1.readString();
         this.var_2059 = param1.readString();
         this.var_2056 = param1.readInteger();
         this._localizationCode = param1.readString();
         this.var_2862 = param1.readInteger();
         this.var_2858 = param1.readInteger();
         this.var_2861 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this._type = "";
         this.var_2059 = "";
         this.var_2056 = 0;
      }
      
      public function get campaignCode() : String
      {
         return this.var_2058;
      }
      
      public function get localizationCode() : String
      {
         return this._localizationCode;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_2859;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_2860;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1687;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_2057;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get imageVersion() : String
      {
         return this.var_2059;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_2056;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2862;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2858;
      }
      
      public function get waitPeriodSeconds() : int
      {
         return this.var_2861;
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.var_2058;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this._localizationCode;
      }
      
      public function get completedCampaign() : Boolean
      {
         return this._id < 1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set accepted(param1:Boolean) : void
      {
         this.var_2057 = param1;
      }
   }
}
