package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1803:IID;
      
      private var var_1108:Boolean;
      
      private var var_1187:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1803 = param1;
         this.var_1187 = new Array();
         this.var_1108 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1803;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1108;
      }
      
      public function get receivers() : Array
      {
         return this.var_1187;
      }
      
      public function dispose() : void
      {
         if(!this.var_1108)
         {
            this.var_1108 = true;
            this.var_1803 = null;
            while(this.var_1187.length > 0)
            {
               this.var_1187.pop();
            }
            this.var_1187 = null;
         }
      }
   }
}
