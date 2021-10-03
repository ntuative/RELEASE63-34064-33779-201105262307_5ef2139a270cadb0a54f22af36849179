package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_3011:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_87 = param1.desktop;
         var_66 = param1.var_1354 as WindowController;
         var_176 = param1.var_1352 as WindowController;
         var_172 = param1.renderer;
         var_887 = param1.var_1353;
         param2.begin();
         param2.end();
         param1.desktop = var_87;
         param1.var_1354 = var_66;
         param1.var_1352 = var_176;
         param1.renderer = var_172;
         param1.var_1353 = var_887;
      }
   }
}
