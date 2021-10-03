package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_64:String = "i";
      
      public static const const_81:String = "s";
      
      public static const const_220:String = "e";
       
      
      private var var_1424:String;
      
      private var var_2412:int;
      
      private var var_1152:String;
      
      private var var_1425:int;
      
      private var var_1741:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1424 = param1.readString();
         this.var_2412 = param1.readInteger();
         this.var_1152 = param1.readString();
         this.var_1425 = param1.readInteger();
         this.var_1741 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1424;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2412;
      }
      
      public function get extraParam() : String
      {
         return this.var_1152;
      }
      
      public function get productCount() : int
      {
         return this.var_1425;
      }
      
      public function get expiration() : int
      {
         return this.var_1741;
      }
   }
}
