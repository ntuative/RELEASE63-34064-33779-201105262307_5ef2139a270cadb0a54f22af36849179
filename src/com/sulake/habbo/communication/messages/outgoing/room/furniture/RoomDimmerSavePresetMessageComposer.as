package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2414:int;
      
      private var var_2413:int;
      
      private var var_2526:String;
      
      private var var_2525:int;
      
      private var var_2524:Boolean;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         this._roomId = param6;
         this._roomCategory = param7;
         this.var_2414 = param1;
         this.var_2413 = param2;
         this.var_2526 = param3;
         this.var_2525 = param4;
         this.var_2524 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2414,this.var_2413,this.var_2526,this.var_2525,int(this.var_2524)];
      }
      
      public function dispose() : void
      {
      }
   }
}
