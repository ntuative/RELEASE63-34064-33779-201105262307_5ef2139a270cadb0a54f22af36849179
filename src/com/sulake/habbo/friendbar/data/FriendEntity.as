package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_966:int;
      
      private var var_792:Boolean;
      
      private var var_1824:Boolean;
      
      private var var_620:String;
      
      private var var_1400:int;
      
      private var var_1827:String;
      
      private var var_1826:String;
      
      private var var_1825:String;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1825 = param3;
         this.var_1827 = param4;
         this.var_966 = param5;
         this.var_792 = param6;
         this.var_1824 = param7;
         this.var_620 = param8;
         this.var_1400 = param9;
         this.var_1826 = param10;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_966;
      }
      
      public function get online() : Boolean
      {
         return this.var_792;
      }
      
      public function get allowFollow() : Boolean
      {
         return this.var_1824;
      }
      
      public function get figure() : String
      {
         return this.var_620;
      }
      
      public function get categoryId() : int
      {
         return this.var_1400;
      }
      
      public function get motto() : String
      {
         return this.var_1827;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1826;
      }
      
      public function get realName() : String
      {
         return this.var_1825;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_966 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_792 = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         this.var_1824 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_620 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1400 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1827 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1826 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1825 = param1;
      }
   }
}
