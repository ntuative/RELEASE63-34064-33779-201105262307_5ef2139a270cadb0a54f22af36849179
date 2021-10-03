package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2857:Boolean;
      
      private var var_2856:int;
      
      private var var_2050:Array;
      
      private var var_868:Array;
      
      private var var_870:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2857;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2856;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_2050;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_868;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_870;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_2050 = [];
         this.var_868 = [];
         this.var_870 = [];
         this.var_2857 = param1.readBoolean();
         this.var_2856 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_2050.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_868.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_870.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
