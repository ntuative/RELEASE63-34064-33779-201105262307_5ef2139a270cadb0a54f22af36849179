package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2207:int = 0;
      
      private var var_1581:String = "";
      
      private var var_2027:String = "";
      
      private var var_2209:String = "";
      
      private var var_2205:String = "";
      
      private var var_1649:int = 0;
      
      private var var_2204:int = 0;
      
      private var var_2206:int = 0;
      
      private var var_1579:int = 0;
      
      private var var_2208:int = 0;
      
      private var var_1578:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2207 = param1;
         this.var_1581 = param2;
         this.var_2027 = param3;
         this.var_2209 = param4;
         this.var_2205 = param5;
         if(param6)
         {
            this.var_1649 = 1;
         }
         else
         {
            this.var_1649 = 0;
         }
         this.var_2204 = param7;
         this.var_2206 = param8;
         this.var_1579 = param9;
         this.var_2208 = param10;
         this.var_1578 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2207,this.var_1581,this.var_2027,this.var_2209,this.var_2205,this.var_1649,this.var_2204,this.var_2206,this.var_1579,this.var_2208,this.var_1578];
      }
   }
}
