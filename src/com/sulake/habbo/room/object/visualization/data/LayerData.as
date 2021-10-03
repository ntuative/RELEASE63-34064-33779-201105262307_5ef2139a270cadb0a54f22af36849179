package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_923:String = "";
      
      public static const const_442:int = 0;
      
      public static const const_537:int = 255;
      
      public static const const_990:Boolean = false;
      
      public static const const_574:int = 0;
      
      public static const const_592:int = 0;
      
      public static const const_441:int = 0;
      
      public static const const_1325:int = 1;
      
      public static const const_1283:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2365:String = "";
      
      private var var_2034:int = 0;
      
      private var var_2706:int = 255;
      
      private var var_2880:Boolean = false;
      
      private var var_2877:int = 0;
      
      private var var_2878:int = 0;
      
      private var var_2879:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2365 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2365;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_2034 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_2034;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2706 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2706;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2880 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2880;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2877 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2877;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2878 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2878;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2879 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2879;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
