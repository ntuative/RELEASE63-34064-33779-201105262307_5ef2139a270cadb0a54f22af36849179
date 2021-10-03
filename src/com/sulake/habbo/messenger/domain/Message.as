package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_801:int = 1;
      
      public static const const_722:int = 2;
      
      public static const const_781:int = 3;
      
      public static const const_1208:int = 4;
      
      public static const const_952:int = 5;
      
      public static const const_1351:int = 6;
       
      
      private var _type:int;
      
      private var var_1290:int;
      
      private var var_2220:String;
      
      private var var_2221:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1290 = param2;
         this.var_2220 = param3;
         this.var_2221 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2220;
      }
      
      public function get time() : String
      {
         return this.var_2221;
      }
      
      public function get senderId() : int
      {
         return this.var_1290;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
