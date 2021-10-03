package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1221:String;
      
      private var var_1458:Array;
      
      private var var_1246:Array;
      
      private var var_1788:int;
      
      public function VoteResultMessageParser()
      {
         super();
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
      
      public function flush() : Boolean
      {
         this.var_1221 = "";
         this.var_1458 = [];
         this.var_1246 = [];
         this.var_1788 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1221 = param1.readString();
         this.var_1458 = [];
         this.var_1246 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1458.push(param1.readString());
            this.var_1246.push(param1.readInteger());
            _loc3_++;
         }
         this.var_1788 = param1.readInteger();
         return true;
      }
   }
}
