package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_620:String;
      
      private var var_2376:String;
      
      private var var_966:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_620 = param1;
         this.var_966 = param2;
         this.var_2376 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_620;
      }
      
      public function get race() : String
      {
         return this.var_2376;
      }
      
      public function get gender() : String
      {
         return this.var_966;
      }
   }
}
