package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_2070:int = 0;
      
      public static const const_1841:int = 1;
      
      public static const const_1914:int = 2;
      
      public static const const_2143:int = 3;
      
      public static const const_2023:int = 4;
      
      public static const const_2008:int = 5;
      
      public static const const_1753:int = 10;
      
      public static const const_2103:int = 11;
      
      public static const const_2028:int = 12;
      
      public static const const_2073:int = 13;
      
      public static const const_2206:int = 16;
      
      public static const const_2199:int = 17;
      
      public static const const_2025:int = 18;
      
      public static const const_2145:int = 19;
      
      public static const const_2057:int = 20;
      
      public static const const_2129:int = 22;
      
      public static const const_2002:int = 23;
      
      public static const const_2082:int = 24;
      
      public static const const_2192:int = 25;
      
      public static const const_2076:int = 26;
      
      public static const const_2064:int = 27;
      
      public static const const_2043:int = 28;
      
      public static const const_2106:int = 29;
      
      public static const const_2196:int = 100;
      
      public static const const_2131:int = 101;
      
      public static const const_2054:int = 102;
      
      public static const const_2146:int = 103;
      
      public static const const_2201:int = 104;
      
      public static const const_2124:int = 105;
      
      public static const const_2127:int = 106;
      
      public static const const_2094:int = 107;
      
      public static const const_2118:int = 108;
      
      public static const const_2173:int = 109;
      
      public static const const_2205:int = 110;
      
      public static const const_2047:int = 111;
      
      public static const const_2140:int = 112;
      
      public static const const_2034:int = 113;
      
      public static const const_2078:int = 114;
      
      public static const const_2037:int = 115;
      
      public static const const_2088:int = 116;
      
      public static const const_2101:int = 117;
      
      public static const const_2175:int = 118;
      
      public static const const_2092:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1841:
            case const_1753:
               return "banned";
            case const_1914:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
