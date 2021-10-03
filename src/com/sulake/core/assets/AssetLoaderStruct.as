package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_910:IAssetLoader;
      
      private var var_2299:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_2299 = param1;
         this.var_910 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_2299;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_910;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_910 != null)
            {
               if(!this.var_910.disposed)
               {
                  this.var_910.dispose();
                  this.var_910 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
