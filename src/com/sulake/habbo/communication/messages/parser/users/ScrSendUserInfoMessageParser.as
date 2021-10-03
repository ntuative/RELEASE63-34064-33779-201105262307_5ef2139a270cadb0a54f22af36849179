package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_2031:int = 1;
      
      public static const const_1815:int = 2;
       
      
      private var var_1063:String;
      
      private var var_2571:int;
      
      private var var_2572:int;
      
      private var var_2570:int;
      
      private var var_2576:int;
      
      private var var_2573:Boolean;
      
      private var var_2446:Boolean;
      
      private var var_2509:int;
      
      private var var_2510:int;
      
      private var var_2574:Boolean;
      
      private var var_2575:int;
      
      private var var_2569:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1063 = param1.readString();
         this.var_2571 = param1.readInteger();
         this.var_2572 = param1.readInteger();
         this.var_2570 = param1.readInteger();
         this.var_2576 = param1.readInteger();
         this.var_2573 = param1.readBoolean();
         this.var_2446 = param1.readBoolean();
         this.var_2509 = param1.readInteger();
         this.var_2510 = param1.readInteger();
         this.var_2574 = param1.readBoolean();
         this.var_2575 = param1.readInteger();
         this.var_2569 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_1063;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2571;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2572;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2570;
      }
      
      public function get responseType() : int
      {
         return this.var_2576;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2573;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2446;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2509;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2510;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2574;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2575;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2569;
      }
   }
}
