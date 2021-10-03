package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2712:String;
      
      private var var_2202:int;
      
      private var var_2199:int;
      
      private var var_2701:String;
      
      private var var_2713:int;
      
      private var var_1846:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2712 = param1.readString();
         this.var_2202 = param1.readInteger();
         this.var_2199 = param1.readInteger();
         this.var_2701 = param1.readString();
         this.var_2713 = param1.readInteger();
         this.var_1846 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2712;
      }
      
      public function get unitPort() : int
      {
         return this.var_2202;
      }
      
      public function get worldId() : int
      {
         return this.var_2199;
      }
      
      public function get castLibs() : String
      {
         return this.var_2701;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2713;
      }
      
      public function get nodeId() : int
      {
         return this.var_1846;
      }
   }
}
