package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2900:int;
      
      private var var_2901:int;
      
      private var var_2899:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2900 = param1;
         this.var_2901 = param2;
         this.var_2899 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2900,this.var_2901,this.var_2899];
      }
      
      public function dispose() : void
      {
      }
   }
}
