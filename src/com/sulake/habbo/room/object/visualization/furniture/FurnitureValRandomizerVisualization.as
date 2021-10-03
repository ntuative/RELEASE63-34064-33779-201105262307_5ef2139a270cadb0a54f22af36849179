package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1053:int = 20;
      
      private static const const_677:int = 10;
      
      private static const const_1522:int = 31;
      
      private static const const_1521:int = 32;
      
      private static const const_678:int = 30;
       
      
      private var var_329:Array;
      
      private var var_852:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_329 = new Array();
         super();
         super.setAnimation(const_678);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            if(!this.var_852)
            {
               this.var_852 = true;
               this.var_329 = new Array();
               this.var_329.push(const_1522);
               this.var_329.push(const_1521);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_677)
         {
            if(this.var_852)
            {
               this.var_852 = false;
               this.var_329 = new Array();
               if(direction == 2)
               {
                  this.var_329.push(const_1053 + 5 - param1);
                  this.var_329.push(const_677 + 5 - param1);
               }
               else
               {
                  this.var_329.push(const_1053 + param1);
                  this.var_329.push(const_677 + param1);
               }
               this.var_329.push(const_678);
               return;
            }
            super.setAnimation(const_678);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
         {
            if(this.var_329.length > 0)
            {
               super.setAnimation(this.var_329.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
