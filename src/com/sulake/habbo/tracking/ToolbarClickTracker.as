package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1379:IHabboTracking;
      
      private var var_2030:Boolean = false;
      
      private var var_2476:int = 0;
      
      private var var_1802:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1379 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1379 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2030 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2476 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_2030)
         {
            return;
         }
         ++this.var_1802;
         if(this.var_1802 <= this.var_2476)
         {
            this.var_1379.track("toolbar",param1);
         }
      }
   }
}
