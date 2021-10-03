package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_384:int;
      
      private var var_801:Boolean;
      
      private var var_955:String;
      
      private var _ownerName:String;
      
      private var var_2258:int;
      
      private var var_2381:int;
      
      private var var_2383:int;
      
      private var var_1682:String;
      
      private var var_2385:int;
      
      private var var_2382:Boolean;
      
      private var var_722:int;
      
      private var var_1400:int;
      
      private var var_2386:String;
      
      private var var_889:Array;
      
      private var var_2384:RoomThumbnailData;
      
      private var var_2261:Boolean;
      
      private var var_2387:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_889 = new Array();
         super();
         this.var_384 = param1.readInteger();
         this.var_801 = param1.readBoolean();
         this.var_955 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2258 = param1.readInteger();
         this.var_2381 = param1.readInteger();
         this.var_2383 = param1.readInteger();
         this.var_1682 = param1.readString();
         this.var_2385 = param1.readInteger();
         this.var_2382 = param1.readBoolean();
         this.var_722 = param1.readInteger();
         this.var_1400 = param1.readInteger();
         this.var_2386 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_889.push(_loc4_);
            _loc3_++;
         }
         this.var_2384 = new RoomThumbnailData(param1);
         this.var_2261 = param1.readBoolean();
         this.var_2387 = param1.readBoolean();
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
      
      public function get flatId() : int
      {
         return this.var_384;
      }
      
      public function get event() : Boolean
      {
         return this.var_801;
      }
      
      public function get roomName() : String
      {
         return this.var_955;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2258;
      }
      
      public function get userCount() : int
      {
         return this.var_2381;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2383;
      }
      
      public function get description() : String
      {
         return this.var_1682;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2385;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2382;
      }
      
      public function get score() : int
      {
         return this.var_722;
      }
      
      public function get categoryId() : int
      {
         return this.var_1400;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2386;
      }
      
      public function get tags() : Array
      {
         return this.var_889;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2384;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2261;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2387;
      }
   }
}
