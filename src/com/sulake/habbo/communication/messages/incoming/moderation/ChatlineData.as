package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2226:int;
      
      private var var_2227:int;
      
      private var var_2224:int;
      
      private var var_2225:String;
      
      private var var_1749:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2226 = param1.readInteger();
         this.var_2227 = param1.readInteger();
         this.var_2224 = param1.readInteger();
         this.var_2225 = param1.readString();
         this.var_1749 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2226;
      }
      
      public function get minute() : int
      {
         return this.var_2227;
      }
      
      public function get chatterId() : int
      {
         return this.var_2224;
      }
      
      public function get chatterName() : String
      {
         return this.var_2225;
      }
      
      public function get msg() : String
      {
         return this.var_1749;
      }
   }
}
