package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2984:uint;
      
      private var var_153:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_247:IWindowContext;
      
      private var var_1162:IMouseDraggingService;
      
      private var var_1159:IMouseScalingService;
      
      private var var_1158:IMouseListenerService;
      
      private var var_1160:IFocusManagerService;
      
      private var var_1161:IToolTipAgentService;
      
      private var var_1157:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2984 = 0;
         this.var_153 = param2;
         this.var_247 = param1;
         this.var_1162 = new WindowMouseDragger(param2);
         this.var_1159 = new WindowMouseScaler(param2);
         this.var_1158 = new WindowMouseListener(param2);
         this.var_1160 = new FocusManager(param2);
         this.var_1161 = new WindowToolTipAgent(param2);
         this.var_1157 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1162 != null)
         {
            this.var_1162.dispose();
            this.var_1162 = null;
         }
         if(this.var_1159 != null)
         {
            this.var_1159.dispose();
            this.var_1159 = null;
         }
         if(this.var_1158 != null)
         {
            this.var_1158.dispose();
            this.var_1158 = null;
         }
         if(this.var_1160 != null)
         {
            this.var_1160.dispose();
            this.var_1160 = null;
         }
         if(this.var_1161 != null)
         {
            this.var_1161.dispose();
            this.var_1161 = null;
         }
         if(this.var_1157 != null)
         {
            this.var_1157.dispose();
            this.var_1157 = null;
         }
         this.var_153 = null;
         this.var_247 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1162;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1159;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1158;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1160;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1161;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1157;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
