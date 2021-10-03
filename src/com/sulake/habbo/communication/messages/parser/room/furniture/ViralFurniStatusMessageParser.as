package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ViralFurniStatusMessageParser implements IMessageParser
   {
       
      
      private var var_187:String;
      
      private var var_219:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1480:int = 0;
      
      private var var_409:int;
      
      private var _shareId:String;
      
      private var var_2337:String;
      
      public function ViralFurniStatusMessageParser()
      {
         super();
      }
      
      public function get campaignID() : String
      {
         return this.var_187;
      }
      
      public function get objectId() : int
      {
         return this.var_219;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1480;
      }
      
      public function get shareId() : String
      {
         return this._shareId;
      }
      
      public function get status() : int
      {
         return this.var_409;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2337;
      }
      
      public function flush() : Boolean
      {
         this._roomId = 0;
         this._roomCategory = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_187 = param1.readString();
         this.var_219 = param1.readInteger();
         this.var_409 = param1.readInteger();
         this._shareId = param1.readString();
         this.var_2337 = param1.readString();
         this.var_1480 = param1.readInteger();
         return true;
      }
   }
}
