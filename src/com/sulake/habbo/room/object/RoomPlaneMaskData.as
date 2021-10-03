package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2217:Number = 0.0;
      
      private var var_2215:Number = 0.0;
      
      private var var_2216:Number = 0.0;
      
      private var var_2214:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2217 = param1;
         this.var_2215 = param2;
         this.var_2216 = param3;
         this.var_2214 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2217;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2215;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2216;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2214;
      }
   }
}
