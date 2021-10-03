package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2496:int;
      
      private var var_2495:int;
      
      private var var_2498:int;
      
      private var var_2497:int;
      
      private var var_107:Array;
      
      private var var_227:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_107 = new Array();
         this.var_227 = new Array();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2496 = param1.readInteger();
         this.var_2495 = param1.readInteger();
         this.var_2498 = param1.readInteger();
         this.var_2497 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_107.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_227.push(new FriendData(param1));
            _loc4_++;
         }
         return true;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2496;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2495;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2498;
      }
      
      public function get categories() : Array
      {
         return this.var_107;
      }
      
      public function get friends() : Array
      {
         return this.var_227;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2497;
      }
   }
}
