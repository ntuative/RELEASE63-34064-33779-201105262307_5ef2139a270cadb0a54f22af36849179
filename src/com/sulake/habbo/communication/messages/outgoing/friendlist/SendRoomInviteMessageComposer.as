package com.sulake.habbo.communication.messages.outgoing.friendlist
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class SendRoomInviteMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_1074:Array;
      
      private var var_1749:String;
      
      public function SendRoomInviteMessageComposer(param1:String)
      {
         this.var_1074 = new Array();
         super();
         this.var_1749 = param1;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:Array = new Array();
         _loc1_.push(this.var_1074.length);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_1074.length)
         {
            _loc1_.push(this.var_1074[_loc2_]);
            _loc2_++;
         }
         _loc1_.push(this.var_1749);
         return _loc1_;
      }
      
      public function addInvitedFriend(param1:int) : void
      {
         this.var_1074.push(param1);
      }
      
      public function dispose() : void
      {
         this.var_1074 = null;
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
   }
}
