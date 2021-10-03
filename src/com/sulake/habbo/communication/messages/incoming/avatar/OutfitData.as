package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1793:int;
      
      private var var_2298:String;
      
      private var var_966:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1793 = param1.readInteger();
         this.var_2298 = param1.readString();
         this.var_966 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1793;
      }
      
      public function get figureString() : String
      {
         return this.var_2298;
      }
      
      public function get gender() : String
      {
         return this.var_966;
      }
   }
}
