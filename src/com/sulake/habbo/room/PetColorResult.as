package com.sulake.habbo.room
{
   public class PetColorResult
   {
       
      
      private var var_2393:int = 0;
      
      private var var_2394:int = 0;
      
      public function PetColorResult(param1:int, param2:int)
      {
         super();
         this.var_2393 = param1 & 16777215;
         this.var_2394 = param2 & 16777215;
      }
      
      public function get primaryColor() : int
      {
         return this.var_2393;
      }
      
      public function get secondaryColor() : int
      {
         return this.var_2394;
      }
   }
}
