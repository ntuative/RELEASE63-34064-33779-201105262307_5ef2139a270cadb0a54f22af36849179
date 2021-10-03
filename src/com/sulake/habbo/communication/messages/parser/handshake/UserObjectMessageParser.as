package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_620:String;
      
      private var var_979:String;
      
      private var var_2329:String;
      
      private var var_1825:String;
      
      private var var_2331:int;
      
      private var var_2332:String;
      
      private var var_2328:int;
      
      private var var_2334:int;
      
      private var var_2333:int;
      
      private var var_1143:int;
      
      private var _petRespectLeft:int;
      
      private var var_2330:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_620 = param1.readString();
         this.var_979 = param1.readString();
         this.var_2329 = param1.readString();
         this.var_1825 = param1.readString();
         this.var_2331 = param1.readInteger();
         this.var_2332 = param1.readString();
         this.var_2328 = param1.readInteger();
         this.var_2334 = param1.readInteger();
         this.var_2333 = param1.readInteger();
         this.var_1143 = param1.readInteger();
         this._petRespectLeft = param1.readInteger();
         this.var_2330 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_620;
      }
      
      public function get sex() : String
      {
         return this.var_979;
      }
      
      public function get customData() : String
      {
         return this.var_2329;
      }
      
      public function get realName() : String
      {
         return this.var_1825;
      }
      
      public function get tickets() : int
      {
         return this.var_2331;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2332;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2328;
      }
      
      public function get directMail() : int
      {
         return this.var_2334;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2333;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1143;
      }
      
      public function get petRespectLeft() : int
      {
         return this._petRespectLeft;
      }
      
      public function get identityId() : int
      {
         return this.var_2330;
      }
   }
}
