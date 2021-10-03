package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1250:int = 1;
      
      public static const const_887:int = 2;
      
      public static const const_806:int = 3;
      
      public static const const_1699:int = 4;
       
      
      private var _index:int;
      
      private var var_2745:String;
      
      private var var_2748:String;
      
      private var var_2744:Boolean;
      
      private var var_2747:String;
      
      private var var_1068:String;
      
      private var var_2746:int;
      
      private var var_2381:int;
      
      private var _type:int;
      
      private var var_2365:String;
      
      private var var_1053:GuestRoomData;
      
      private var var_1052:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2745 = param1.readString();
         this.var_2748 = param1.readString();
         this.var_2744 = param1.readInteger() == 1;
         this.var_2747 = param1.readString();
         this.var_1068 = param1.readString();
         this.var_2746 = param1.readInteger();
         this.var_2381 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1250)
         {
            this.var_2365 = param1.readString();
         }
         else if(this._type == const_806)
         {
            this.var_1052 = new PublicRoomData(param1);
         }
         else if(this._type == const_887)
         {
            this.var_1053 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_1053 != null)
         {
            this.var_1053.dispose();
            this.var_1053 = null;
         }
         if(this.var_1052 != null)
         {
            this.var_1052.dispose();
            this.var_1052 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2745;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2748;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2744;
      }
      
      public function get picText() : String
      {
         return this.var_2747;
      }
      
      public function get picRef() : String
      {
         return this.var_1068;
      }
      
      public function get folderId() : int
      {
         return this.var_2746;
      }
      
      public function get tag() : String
      {
         return this.var_2365;
      }
      
      public function get userCount() : int
      {
         return this.var_2381;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_1053;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_1052;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1250)
         {
            return 0;
         }
         if(this.type == const_887)
         {
            return this.var_1053.maxUserCount;
         }
         if(this.type == const_806)
         {
            return this.var_1052.maxUsers;
         }
         return 0;
      }
   }
}
