package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1053:int = 10;
      
      private static const const_677:int = 20;
      
      private static const const_1522:int = 31;
      
      private static const const_1521:int = 32;
       
      
      private var var_329:Array;
      
      private var var_852:Boolean = false;
      
      public function FurnitureHabboWheelVisualization()
      {
         this.var_329 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
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
         if(param1 > 0 && param1 <= const_1053)
         {
            if(this.var_852)
            {
               this.var_852 = false;
               this.var_329 = new Array();
               this.var_329.push(const_1053 + param1);
               this.var_329.push(const_677 + param1);
               this.var_329.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
