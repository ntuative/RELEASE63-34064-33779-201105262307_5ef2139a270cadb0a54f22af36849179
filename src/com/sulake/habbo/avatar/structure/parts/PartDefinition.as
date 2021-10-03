package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2463:String;
      
      private var var_1781:String;
      
      private var var_2462:String;
      
      private var var_1780:Boolean;
      
      private var var_1782:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2463 = String(param1["set-type"]);
         this.var_1781 = String(param1["flipped-set-type"]);
         this.var_2462 = String(param1["remove-set-type"]);
         this.var_1780 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1782 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1782;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1782 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2463;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1781;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2462;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1780;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1780 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1781 = param1;
      }
   }
}
