package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageResultMessageParser implements IMessageParser
   {
       
      
      private var var_219:int = 0;
      
      private var var_2107:int = 0;
      
      private var var_2108:String = null;
      
      public function OpenPetPackageResultMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_219;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_2107;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_2108;
      }
      
      public function flush() : Boolean
      {
         this.var_219 = 0;
         this.var_2107 = 0;
         this.var_2108 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_219 = param1.readInteger();
         this.var_2107 = param1.readInteger();
         this.var_2108 = param1.readString();
         return true;
      }
   }
}
