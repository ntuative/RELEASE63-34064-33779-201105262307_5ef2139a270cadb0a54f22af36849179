package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class FurnitureData
   {
       
      
      private var _id:int = 0;
      
      private var var_2456:int = 0;
      
      private var _type:String = null;
      
      private var var_95:Vector3d;
      
      private var var_418:Vector3d;
      
      private var _state:int = 0;
      
      private var _data:String = null;
      
      private var var_1536:Number = NaN;
      
      private var var_2516:int = -1;
      
      private var var_2230:Boolean = false;
      
      public function FurnitureData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int, param7:String, param8:Number = NaN, param9:int = -1, param10:Boolean = false)
      {
         this.var_95 = new Vector3d();
         this.var_418 = new Vector3d();
         super();
         this._id = param1;
         this.var_2456 = param2;
         this._type = param3;
         this.var_95.assign(param4);
         this.var_418.assign(param5);
         this._state = param6;
         this._data = param7;
         this.var_1536 = param8;
         this.var_2516 = param9;
         this.var_2230 = param10;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get typeId() : int
      {
         return this.var_2456;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get loc() : IVector3d
      {
         return this.var_95;
      }
      
      public function get dir() : IVector3d
      {
         return this.var_418;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get extra() : Number
      {
         return this.var_1536;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2516;
      }
      
      public function get knownAsUsable() : Boolean
      {
         return this.var_2230;
      }
   }
}
