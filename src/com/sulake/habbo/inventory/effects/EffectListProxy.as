package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDataProvider;
   
   public class EffectListProxy implements IThumbListDataProvider
   {
       
      
      private var var_71:EffectsModel;
      
      private var var_135:int;
      
      public function EffectListProxy(param1:EffectsModel, param2:int)
      {
         super();
         this.var_71 = param1;
         this.var_135 = param2;
      }
      
      public function dispose() : void
      {
         this.var_71 = null;
      }
      
      public function getDrawableList() : Array
      {
         return this.var_71.getEffects(this.var_135);
      }
   }
}
