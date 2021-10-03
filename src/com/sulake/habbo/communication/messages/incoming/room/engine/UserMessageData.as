package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1298:String = "M";
      
      public static const const_1798:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_163:Number = 0;
      
      private var var_164:Number = 0;
      
      private var var_418:int = 0;
      
      private var _name:String = "";
      
      private var var_1635:int = 0;
      
      private var var_979:String = "";
      
      private var var_620:String = "";
      
      private var var_2488:String = "";
      
      private var var_2347:int;
      
      private var var_2356:int = 0;
      
      private var var_2486:String = "";
      
      private var var_2487:int = 0;
      
      private var var_2352:int = 0;
      
      private var var_2792:String = "";
      
      private var var_194:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_194 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_194)
         {
            this._x = param1;
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
      
      public function get dir() : int
      {
         return this.var_418;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_194)
         {
            this.var_418 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_194)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_1635;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_194)
         {
            this.var_1635 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_979;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_194)
         {
            this.var_979 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_620;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_194)
         {
            this.var_620 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2488;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_194)
         {
            this.var_2488 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2347;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_194)
         {
            this.var_2347 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2356;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_194)
         {
            this.var_2356 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2486;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_194)
         {
            this.var_2486 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2487;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_194)
         {
            this.var_2487 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2352;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_194)
         {
            this.var_2352 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2792;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_194)
         {
            this.var_2792 = param1;
         }
      }
   }
}
