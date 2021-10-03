package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1858:String = "WE_DESTROY";
      
      public static const const_356:String = "WE_DESTROYED";
      
      public static const const_1811:String = "WE_OPEN";
      
      public static const const_1804:String = "WE_OPENED";
      
      public static const const_1742:String = "WE_CLOSE";
      
      public static const const_1897:String = "WE_CLOSED";
      
      public static const const_1667:String = "WE_FOCUS";
      
      public static const const_345:String = "WE_FOCUSED";
      
      public static const const_1917:String = "WE_UNFOCUS";
      
      public static const const_1877:String = "WE_UNFOCUSED";
      
      public static const const_1874:String = "WE_ACTIVATE";
      
      public static const const_620:String = "WE_ACTIVATED";
      
      public static const const_1666:String = "WE_DEACTIVATE";
      
      public static const const_580:String = "WE_DEACTIVATED";
      
      public static const const_331:String = "WE_SELECT";
      
      public static const const_50:String = "WE_SELECTED";
      
      public static const const_477:String = "WE_UNSELECT";
      
      public static const const_589:String = "WE_UNSELECTED";
      
      public static const const_1728:String = "WE_LOCK";
      
      public static const const_1818:String = "WE_LOCKED";
      
      public static const const_1868:String = "WE_UNLOCK";
      
      public static const const_1733:String = "WE_UNLOCKED";
      
      public static const const_829:String = "WE_ENABLE";
      
      public static const const_281:String = "WE_ENABLED";
      
      public static const const_987:String = "WE_DISABLE";
      
      public static const const_263:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_393:String = "WE_RELOCATED";
      
      public static const const_1128:String = "WE_RESIZE";
      
      public static const const_40:String = "WE_RESIZED";
      
      public static const const_1642:String = "WE_MINIMIZE";
      
      public static const const_1759:String = "WE_MINIMIZED";
      
      public static const const_1684:String = "WE_MAXIMIZE";
      
      public static const const_1848:String = "WE_MAXIMIZED";
      
      public static const const_1771:String = "WE_RESTORE";
      
      public static const const_1825:String = "WE_RESTORED";
      
      public static const const_333:String = "WE_CHILD_ADDED";
      
      public static const const_439:String = "WE_CHILD_REMOVED";
      
      public static const const_210:String = "WE_CHILD_RELOCATED";
      
      public static const const_133:String = "WE_CHILD_RESIZED";
      
      public static const const_351:String = "WE_CHILD_ACTIVATED";
      
      public static const const_619:String = "WE_PARENT_ADDED";
      
      public static const const_1740:String = "WE_PARENT_REMOVED";
      
      public static const const_1900:String = "WE_PARENT_RELOCATED";
      
      public static const const_870:String = "WE_PARENT_RESIZED";
      
      public static const const_1241:String = "WE_PARENT_ACTIVATED";
      
      public static const const_182:String = "WE_OK";
      
      public static const const_628:String = "WE_CANCEL";
      
      public static const const_109:String = "WE_CHANGE";
      
      public static const const_511:String = "WE_SCROLL";
      
      public static const const_111:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_707:IWindow;
      
      protected var var_1099:Boolean;
      
      protected var var_484:Boolean;
      
      protected var var_480:Boolean;
      
      protected var var_708:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_707 = param3;
         _loc5_.var_484 = param4;
         _loc5_.var_480 = false;
         _loc5_.var_708 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_707;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_484;
      }
      
      public function recycle() : void
      {
         if(this.var_480)
         {
            throw new Error("Event already recycled!");
         }
         this.var_707 = null;
         this._window = null;
         this.var_480 = true;
         this.var_1099 = false;
         this.var_708.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1099;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1099 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1099;
      }
      
      public function stopPropagation() : void
      {
         this.var_1099 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1099 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_484 + " window: " + this._window + " }";
      }
   }
}
