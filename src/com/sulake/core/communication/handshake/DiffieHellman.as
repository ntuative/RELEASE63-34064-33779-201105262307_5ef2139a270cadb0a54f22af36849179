package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1049:BigInteger;
      
      private var var_2722:BigInteger;
      
      private var var_1966:BigInteger;
      
      private var var_2721:BigInteger;
      
      private var var_1545:BigInteger;
      
      private var var_1967:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1545 = param1;
         this.var_1967 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1545.toString() + ",generator: " + this.var_1967.toString() + ",secret: " + param1);
         this.var_1049 = new BigInteger();
         this.var_1049.fromRadix(param1,param2);
         this.var_2722 = this.var_1967.modPow(this.var_1049,this.var_1545);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1966 = new BigInteger();
         this.var_1966.fromRadix(param1,param2);
         this.var_2721 = this.var_1966.modPow(this.var_1049,this.var_1545);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2722.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2721.toRadix(param1);
      }
   }
}
