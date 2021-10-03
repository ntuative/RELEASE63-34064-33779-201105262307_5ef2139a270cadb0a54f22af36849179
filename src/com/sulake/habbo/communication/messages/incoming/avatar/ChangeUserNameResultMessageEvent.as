package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   
   public class ChangeUserNameResultMessageEvent extends MessageEvent implements IMessageEvent
   {
      
      public static var var_574:int = 0;
      
      public static var var_885:int = 1;
      
      public static var var_882:int = 2;
      
      public static var var_881:int = 3;
      
      public static var var_884:int = 4;
      
      public static var var_880:int = 5;
      
      public static var var_1095:int = 6;
      
      public static var var_1093:int = 7;
       
      
      public function ChangeUserNameResultMessageEvent(param1:Function)
      {
         super(param1,ChangeUserNameResultMessageParser);
      }
      
      public function getParser() : ChangeUserNameResultMessageParser
      {
         return var_10 as ChangeUserNameResultMessageParser;
      }
   }
}
