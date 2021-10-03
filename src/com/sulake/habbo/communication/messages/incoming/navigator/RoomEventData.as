package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_2002:Boolean;
      
      private var var_2786:int;
      
      private var var_2784:String;
      
      private var var_384:int;
      
      private var var_2787:int;
      
      private var var_2052:String;
      
      private var var_2788:String;
      
      private var var_2785:String;
      
      private var var_889:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_889 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_2002 = false;
            return;
         }
         this.var_2002 = true;
         this.var_2786 = int(_loc2_);
         this.var_2784 = param1.readString();
         this.var_384 = int(param1.readString());
         this.var_2787 = param1.readInteger();
         this.var_2052 = param1.readString();
         this.var_2788 = param1.readString();
         this.var_2785 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_889.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_889 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2786;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2784;
      }
      
      public function get flatId() : int
      {
         return this.var_384;
      }
      
      public function get eventType() : int
      {
         return this.var_2787;
      }
      
      public function get eventName() : String
      {
         return this.var_2052;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2788;
      }
      
      public function get creationTime() : String
      {
         return this.var_2785;
      }
      
      public function get tags() : Array
      {
         return this.var_889;
      }
      
      public function get exists() : Boolean
      {
         return this.var_2002;
      }
   }
}
