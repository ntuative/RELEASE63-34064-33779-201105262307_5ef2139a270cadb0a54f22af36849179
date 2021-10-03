package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestController implements IDisposable, IUpdateReceiver
   {
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_607:QuestsList;
      
      private var var_509:QuestDetails;
      
      private var _questCompleted:QuestCompleted;
      
      private var var_353:QuestTracker;
      
      private var var_937:CampaignCompleted;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
         this.var_353 = new QuestTracker(this._questEngine);
         this.var_607 = new QuestsList(this._questEngine);
         this.var_509 = new QuestDetails(this._questEngine);
         this._questCompleted = new QuestCompleted(this._questEngine);
         this.var_937 = new CampaignCompleted(this._questEngine);
      }
      
      public function onToolbarClick() : void
      {
         this.var_607.onToolbarClick();
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         this.var_607.onQuests(param1,param2);
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.var_353.onQuest(param1);
         this.var_509.onQuest(param1);
         this._questCompleted.onQuest(param1);
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.var_353.onQuestCompleted(param1);
         this.var_509.onQuestCompleted(param1);
         this._questCompleted.onQuestCompleted(param1);
      }
      
      public function onQuestCancelled() : void
      {
         this.var_353.onQuestCancelled();
         this.var_509.onQuestCancelled();
         this._questCompleted.onQuestCancelled();
      }
      
      public function onRoomEnter() : void
      {
         this.var_353.onRoomEnter();
      }
      
      public function onRoomExit() : void
      {
         this.var_607.onRoomExit();
         this.var_353.onRoomExit();
         this.var_509.onRoomExit();
         this.var_937.onRoomExit();
      }
      
      public function update(param1:uint) : void
      {
         this._questCompleted.update(param1);
         this.var_353.update(param1);
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         if(this.var_607)
         {
            this.var_607.dispose();
            this.var_607 = null;
         }
         if(this.var_353)
         {
            this.var_353.dispose();
            this.var_353 = null;
         }
         if(this.var_509)
         {
            this.var_509.dispose();
            this.var_509 = null;
         }
         if(this._questCompleted)
         {
            this._questCompleted.dispose();
            this._questCompleted = null;
         }
         if(this.var_937)
         {
            this.var_937.dispose();
            this.var_937 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function get questsList() : QuestsList
      {
         return this.var_607;
      }
      
      public function get questDetails() : QuestDetails
      {
         return this.var_509;
      }
      
      public function get questTracker() : QuestTracker
      {
         return this.var_353;
      }
      
      public function get campaignCompleted() : CampaignCompleted
      {
         return this.var_937;
      }
   }
}
