package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_155:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_147:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1221:String;
      
      private var var_1458:Array;
      
      private var var_1246:Array;
      
      private var var_1788:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1221 = param2;
         this.var_1458 = param3;
         this.var_1246 = param4;
         if(this.var_1246 == null)
         {
            this.var_1246 = [];
         }
         this.var_1788 = param5;
      }
      
      public function get question() : String
      {
         return this.var_1221;
      }
      
      public function get choices() : Array
      {
         return this.var_1458.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1246.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1788;
      }
   }
}
