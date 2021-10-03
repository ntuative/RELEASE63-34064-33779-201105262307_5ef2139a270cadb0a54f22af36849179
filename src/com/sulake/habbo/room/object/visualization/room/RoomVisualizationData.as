package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_496:WallRasterizer;
      
      private var var_498:FloorRasterizer;
      
      private var var_723:WallAdRasterizer;
      
      private var var_497:LandscapeRasterizer;
      
      private var var_724:PlaneMaskManager;
      
      private var var_807:Boolean = false;
      
      public function RoomVisualizationData()
      {
         super();
         this.var_496 = new WallRasterizer();
         this.var_498 = new FloorRasterizer();
         this.var_723 = new WallAdRasterizer();
         this.var_497 = new LandscapeRasterizer();
         this.var_724 = new PlaneMaskManager();
      }
      
      public function get initialized() : Boolean
      {
         return this.var_807;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return this.var_498;
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return this.var_496;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return this.var_723;
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return this.var_497;
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return this.var_724;
      }
      
      public function dispose() : void
      {
         if(this.var_496 != null)
         {
            this.var_496.dispose();
            this.var_496 = null;
         }
         if(this.var_498 != null)
         {
            this.var_498.dispose();
            this.var_498 = null;
         }
         if(this.var_723 != null)
         {
            this.var_723.dispose();
            this.var_723 = null;
         }
         if(this.var_497 != null)
         {
            this.var_497.dispose();
            this.var_497 = null;
         }
         if(this.var_724 != null)
         {
            this.var_724.dispose();
            this.var_724 = null;
         }
      }
      
      public function clearCache() : void
      {
         if(this.var_496 != null)
         {
            this.var_496.clearCache();
         }
         if(this.var_498 != null)
         {
            this.var_498.clearCache();
         }
         if(this.var_497 != null)
         {
            this.var_497.clearCache();
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         this.reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            this.var_496.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            this.var_498.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            this.var_723.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            this.var_497.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            this.var_724.initialize(_loc11_);
         }
         return true;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(this.var_807)
         {
            return;
         }
         this.var_496.initializeAssetCollection(param1);
         this.var_498.initializeAssetCollection(param1);
         this.var_723.initializeAssetCollection(param1);
         this.var_497.initializeAssetCollection(param1);
         this.var_724.initializeAssetCollection(param1);
         this.var_807 = true;
      }
      
      protected function reset() : void
      {
      }
   }
}
