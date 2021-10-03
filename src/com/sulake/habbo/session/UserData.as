package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var _type:int = 0;
      
      private var var_979:String = "";
      
      private var var_620:String = "";
      
      private var var_2488:String = "";
      
      private var var_2347:int;
      
      private var var_2356:int = 0;
      
      private var var_2486:String = "";
      
      private var var_2487:int = 0;
      
      private var var_2352:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2347;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2347 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get sex() : String
      {
         return this.var_979;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_979 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_620;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_620 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_2488;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_2488 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2356;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2356 = param1;
      }
      
      public function get groupID() : String
      {
         return this.var_2486;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_2486 = param1;
      }
      
      public function get groupStatus() : int
      {
         return this.var_2487;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_2487 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2352;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2352 = param1;
      }
   }
}
