package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      public static const const_2032:int = 16777215;
      
      public static const const_1301:int = 8191;
      
      public static const const_1142:int = 8191;
      
      public static const const_2016:int = 1;
      
      public static const const_1169:int = 1;
      
      public static const const_1297:int = 1;
      
      private static var var_561:uint = 0;
      
      private static var var_560:uint = 0;
       
      
      private var _owner:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         if(param2 > const_1301)
         {
            param2 = const_1301;
         }
         else if(param2 < const_1169)
         {
            param2 = const_1169;
         }
         if(param3 > const_1142)
         {
            param3 = const_1142;
         }
         else if(param3 < const_1297)
         {
            param3 = const_1297;
         }
         super(param2,param3,param4,param5);
         ++var_561;
         var_560 += param2 * param3 * 4;
         this._owner = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_561;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_560;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_560 -= width * height * 4;
            --var_561;
            this._disposed = true;
            this._owner = null;
            super.dispose();
         }
      }
   }
}
