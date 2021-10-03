package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl
   {
      
      private static var _type:uint = MouseCursorType.const_30;
      
      private static var var_136:Stage;
      
      private static var var_295:Boolean = true;
      
      private static var _disposed:Boolean = false;
      
      private static var var_735:Boolean = true;
      
      private static var var_116:DisplayObject;
      
      private static var var_1401:Dictionary = new Dictionary();
       
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         var_136 = param1.stage;
      }
      
      public static function dispose() : void
      {
         if(!_disposed)
         {
            if(var_116)
            {
               var_136.removeChild(var_116);
               var_136.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
               var_136.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
               var_136.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
               var_136.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            }
            _disposed = true;
         }
      }
      
      public static function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public static function get type() : uint
      {
         return _type;
      }
      
      public static function set type(param1:uint) : void
      {
         if(_type != param1)
         {
            _type = param1;
            var_735 = true;
         }
      }
      
      public static function get visible() : Boolean
      {
         return var_295;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         var_295 = param1;
         if(var_295)
         {
            if(var_116)
            {
               var_116.visible = true;
            }
            else
            {
               Mouse.show();
            }
         }
         else if(var_116)
         {
            var_116.visible = false;
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public static function change() : void
      {
         var _loc1_:* = null;
         if(var_735)
         {
            _loc1_ = var_1401[_type];
            if(_loc1_)
            {
               if(var_116)
               {
                  var_136.removeChild(var_116);
               }
               else
               {
                  var_136.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_136.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_136.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_136.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  Mouse.hide();
               }
               var_116 = _loc1_;
               var_136.addChild(var_116);
            }
            else
            {
               if(var_116)
               {
                  var_136.removeChild(var_116);
                  var_136.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_136.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_136.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_136.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  var_116 = null;
                  Mouse.show();
               }
               switch(_type)
               {
                  case MouseCursorType.const_30:
                  case MouseCursorType.ARROW:
                     Mouse.cursor = MouseCursor.ARROW;
                     break;
                  case MouseCursorType.const_359:
                     Mouse.cursor = MouseCursor.BUTTON;
                     break;
                  case MouseCursorType.const_864:
                  case MouseCursorType.const_272:
                  case MouseCursorType.const_1659:
                  case MouseCursorType.const_1748:
                     Mouse.cursor = MouseCursor.HAND;
                     break;
                  case MouseCursorType.NONE:
                     Mouse.cursor = MouseCursor.ARROW;
                     Mouse.hide();
               }
            }
            var_735 = false;
         }
      }
      
      public static function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1401[param1] = param2;
      }
      
      private static function onStageMouseMove(param1:MouseEvent) : void
      {
         if(var_116)
         {
            var_116.x = param1.stageX - 2;
            var_116.y = param1.stageY;
            if(_type == MouseCursorType.const_30)
            {
               var_295 = false;
               Mouse.show();
            }
            else
            {
               var_295 = true;
               Mouse.hide();
            }
         }
      }
      
      private static function onStageMouseLeave(param1:Event) : void
      {
         if(var_116 && _type != MouseCursorType.const_30)
         {
            Mouse.hide();
            var_295 = false;
         }
      }
   }
}
