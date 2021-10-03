package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1871:int;
      
      private var _currentPosition:int;
      
      private var var_1868:int;
      
      private var var_1869:int;
      
      private var var_1870:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1871;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1868;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1869;
      }
      
      public function get syncCount() : int
      {
         return this.var_1870;
      }
      
      public function flush() : Boolean
      {
         this.var_1871 = -1;
         this._currentPosition = -1;
         this.var_1868 = -1;
         this.var_1869 = -1;
         this.var_1870 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1871 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1868 = param1.readInteger();
         this.var_1869 = param1.readInteger();
         this.var_1870 = param1.readInteger();
         return true;
      }
   }
}
