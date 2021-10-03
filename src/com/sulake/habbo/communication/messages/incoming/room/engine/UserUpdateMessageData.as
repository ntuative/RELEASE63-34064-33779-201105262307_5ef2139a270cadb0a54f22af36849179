package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_163:Number = 0;
      
      private var var_164:Number = 0;
      
      private var var_2429:Number = 0;
      
      private var var_2434:Number = 0;
      
      private var var_2432:Number = 0;
      
      private var var_2433:Number = 0;
      
      private var var_418:int = 0;
      
      private var var_2431:int = 0;
      
      private var var_339:Array;
      
      private var var_2430:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_339 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_163 = param3;
         this.var_164 = param4;
         this.var_2429 = param5;
         this.var_418 = param6;
         this.var_2431 = param7;
         this.var_2434 = param8;
         this.var_2432 = param9;
         this.var_2433 = param10;
         this.var_2430 = param11;
         this.var_339 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_163;
      }
      
      public function get z() : Number
      {
         return this.var_164;
      }
      
      public function get localZ() : Number
      {
         return this.var_2429;
      }
      
      public function get targetX() : Number
      {
         return this.var_2434;
      }
      
      public function get targetY() : Number
      {
         return this.var_2432;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2433;
      }
      
      public function get dir() : int
      {
         return this.var_418;
      }
      
      public function get dirHead() : int
      {
         return this.var_2431;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2430;
      }
      
      public function get actions() : Array
      {
         return this.var_339.slice();
      }
   }
}
