package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1846:int;
      
      private var var_2391:String;
      
      private var var_295:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1846 = param1.readInteger();
         this.var_2391 = param1.readString();
         this.var_295 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1846;
      }
      
      public function get nodeName() : String
      {
         return this.var_2391;
      }
      
      public function get visible() : Boolean
      {
         return this.var_295;
      }
   }
}
