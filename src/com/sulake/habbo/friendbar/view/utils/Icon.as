package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class Icon implements IDisposable
   {
      
      protected static const const_2216:int = 0;
      
      protected static const const_638:int = 1;
      
      protected static const const_1944:int = 2;
      
      protected static const const_1946:int = 3;
      
      protected static const const_122:int = 4;
      
      protected static const const_639:int = 8;
      
      protected static const const_246:int = 18;
      
      protected static const const_1945:int = 18;
       
      
      private var _disposed:Boolean = false;
      
      private var var_1710:Boolean = false;
      
      protected var var_47:BitmapDataAsset;
      
      protected var var_88:IBitmapWrapperWindow;
      
      private var var_1186:uint;
      
      protected var var_201:Timer;
      
      protected var _frame:int = 0;
      
      private var var_621:Point;
      
      protected var var_890:Boolean = false;
      
      protected var _hover:Boolean = false;
      
      public function Icon()
      {
         this.var_1186 = const_638 | const_639;
         this.var_621 = new Point();
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get disabled() : Boolean
      {
         return this.var_1710;
      }
      
      protected function set image(param1:BitmapDataAsset) : void
      {
         this.var_47 = param1;
         this.redraw();
      }
      
      protected function get image() : BitmapDataAsset
      {
         return this.var_47;
      }
      
      protected function set canvas(param1:IBitmapWrapperWindow) : void
      {
         this.var_88 = param1;
         this.redraw();
      }
      
      protected function get canvas() : IBitmapWrapperWindow
      {
         return this.var_88;
      }
      
      protected function set alignment(param1:uint) : void
      {
         this.var_1186 = param1;
         this.redraw();
      }
      
      protected function get alignment() : uint
      {
         return this.var_1186;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.toggleTimer(false,0);
            this.image = null;
            this.canvas = null;
            this._disposed = true;
         }
      }
      
      public function notify(param1:Boolean) : void
      {
         this.var_890 = param1;
         if(this.var_890 && this.var_1710)
         {
            this.enable(true);
         }
      }
      
      public function hover(param1:Boolean) : void
      {
         this._hover = param1;
      }
      
      public function enable(param1:Boolean) : void
      {
         this.var_1710 = !param1;
      }
      
      protected function redraw() : void
      {
         var _loc1_:* = null;
         if(this.var_88 && !this.var_88.disposed)
         {
            if(!this.var_88.bitmap)
            {
               this.var_88.bitmap = new BitmapData(this.var_88.width,this.var_88.height,true,0);
            }
            else
            {
               this.var_88.bitmap.fillRect(this.var_88.bitmap.rect,0);
            }
            if(this.var_47 && !this.var_47.disposed)
            {
               this.var_621.x = this.var_621.y = 0;
               _loc1_ = this.var_47.content as BitmapData;
               switch(this.var_1186 & const_1946)
               {
                  case const_638:
                     this.var_621.x = this.var_88.bitmap.width / 2 - _loc1_.width / 2;
                     break;
                  case const_1944:
                     this.var_621.x = this.var_88.bitmap.width - _loc1_.width;
               }
               switch(this.var_1186 & const_1945)
               {
                  case const_639:
                     this.var_621.y = this.var_88.bitmap.height / 2 - _loc1_.height / 2;
                     break;
                  case const_246:
                     this.var_621.y = this.var_88.bitmap.height - _loc1_.height;
               }
               this.var_88.bitmap.copyPixels(_loc1_,_loc1_.rect,this.var_621);
               this.var_88.invalidate();
            }
         }
      }
      
      protected function toggleTimer(param1:Boolean, param2:int) : void
      {
         if(param1)
         {
            if(!this.var_201)
            {
               this.var_201 = new Timer(param2,0);
               this.var_201.addEventListener(TimerEvent.TIMER,this.onTimerEvent);
               this.var_201.start();
               this.onTimerEvent(null);
            }
            this.var_201.delay = param2;
         }
         else
         {
            this._frame = 0;
            if(this.var_201)
            {
               this.var_201.reset();
               this.var_201.removeEventListener(TimerEvent.TIMER,this.onTimerEvent);
               this.var_201 = null;
            }
         }
      }
      
      protected function onTimerEvent(param1:TimerEvent) : void
      {
      }
   }
}
