package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var _id:int = 0;
      
      private var var_2228:Boolean = false;
      
      private var var_2232:int = 0;
      
      private var var_2231:int = 0;
      
      private var var_2229:int = 0;
      
      private var var_2233:int = 0;
      
      private var var_163:Number = 0;
      
      private var var_164:Number = 0;
      
      private var var_418:String = "";
      
      private var _type:int = 0;
      
      private var var_3003:String = "";
      
      private var var_1536:int = 0;
      
      private var _state:int = 0;
      
      private var _data:String = "";
      
      private var var_194:Boolean = false;
      
      private var var_2230:Boolean;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         this._id = param1;
         this._type = param2;
         this.var_2228 = param3;
      }
      
      public function setReadOnly() : void
      {
         this.var_194 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get isOldFormat() : Boolean
      {
         return this.var_2228;
      }
      
      public function get wallX() : Number
      {
         return this.var_2232;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!this.var_194)
         {
            this.var_2232 = param1;
         }
      }
      
      public function get wallY() : Number
      {
         return this.var_2231;
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!this.var_194)
         {
            this.var_2231 = param1;
         }
      }
      
      public function get localX() : Number
      {
         return this.var_2229;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!this.var_194)
         {
            this.var_2229 = param1;
         }
      }
      
      public function get localY() : Number
      {
         return this.var_2233;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!this.var_194)
         {
            this.var_2233 = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_163;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_194)
         {
            this.var_163 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_164;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_194)
         {
            this.var_164 = param1;
         }
      }
      
      public function get dir() : String
      {
         return this.var_418;
      }
      
      public function set dir(param1:String) : void
      {
         if(!this.var_194)
         {
            this.var_418 = param1;
         }
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         if(!this.var_194)
         {
            this._type = param1;
         }
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set state(param1:int) : void
      {
         if(!this.var_194)
         {
            this._state = param1;
         }
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function set data(param1:String) : void
      {
         if(!this.var_194)
         {
            this._data = param1;
         }
      }
      
      public function get knownAsUsable() : Boolean
      {
         return this.var_2230;
      }
      
      public function set knownAsUsable(param1:Boolean) : void
      {
         if(!this.var_194)
         {
            this.var_2230 = param1;
         }
      }
   }
}
