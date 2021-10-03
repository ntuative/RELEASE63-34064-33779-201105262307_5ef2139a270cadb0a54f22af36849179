package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1521:int = 3;
      
      private static const const_1615:int = 2;
      
      private static const const_1614:int = 1;
      
      private static const const_1613:int = 15;
       
      
      private var var_329:Array;
      
      private var var_1326:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_329 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1615)
         {
            this.var_329 = new Array();
            this.var_329.push(const_1614);
            this.var_1326 = const_1613;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1326 > 0)
         {
            --this.var_1326;
         }
         if(this.var_1326 == 0)
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
