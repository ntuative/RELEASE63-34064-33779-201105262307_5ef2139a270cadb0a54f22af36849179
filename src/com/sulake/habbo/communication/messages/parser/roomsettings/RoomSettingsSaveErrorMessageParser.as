package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_2035:int = 1;
      
      public static const const_2188:int = 2;
      
      public static const const_2116:int = 3;
      
      public static const const_2121:int = 4;
      
      public static const const_1899:int = 5;
      
      public static const const_2050:int = 6;
      
      public static const const_1878:int = 7;
      
      public static const const_1796:int = 8;
      
      public static const const_2193:int = 9;
      
      public static const const_1886:int = 10;
      
      public static const const_1769:int = 11;
      
      public static const const_1640:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1702:int;
      
      private var var_699:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1702 = param1.readInteger();
         this.var_699 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1702;
      }
      
      public function get info() : String
      {
         return this.var_699;
      }
   }
}
