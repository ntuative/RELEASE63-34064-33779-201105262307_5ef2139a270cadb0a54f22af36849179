package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_416:RoomObjectLocationCacheItem = null;
      
      private var var_206:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         this.var_416 = new RoomObjectLocationCacheItem(param1);
         this.var_206 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return this.var_416;
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return this.var_206;
      }
      
      public function dispose() : void
      {
         if(this.var_416 != null)
         {
            this.var_416.dispose();
            this.var_416 = null;
         }
         if(this.var_206 != null)
         {
            this.var_206.dispose();
            this.var_206 = null;
         }
      }
   }
}
