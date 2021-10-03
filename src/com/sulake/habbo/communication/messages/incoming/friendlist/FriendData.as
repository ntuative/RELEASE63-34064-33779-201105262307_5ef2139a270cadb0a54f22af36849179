package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_966:int;
      
      private var var_792:Boolean;
      
      private var var_1989:Boolean;
      
      private var var_620:String;
      
      private var var_1400:int;
      
      private var var_1827:String;
      
      private var var_1826:String;
      
      private var var_1825:String;
      
      private var var_2514:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_966 = param1.readInteger();
         this.var_792 = param1.readBoolean();
         this.var_1989 = param1.readBoolean();
         this.var_620 = param1.readString();
         this.var_1400 = param1.readInteger();
         this.var_1827 = param1.readString();
         this.var_1826 = param1.readString();
         this.var_1825 = param1.readString();
         this.var_2514 = param1.readString();
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
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1989;
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
      
      public function get facebookId() : String
      {
         return this.var_2514;
      }
   }
}
