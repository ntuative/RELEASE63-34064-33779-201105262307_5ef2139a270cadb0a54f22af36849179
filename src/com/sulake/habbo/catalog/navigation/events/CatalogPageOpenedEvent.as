package com.sulake.habbo.catalog.navigation.events
{
   import flash.events.Event;
   
   public class CatalogPageOpenedEvent extends Event
   {
      
      public static const CATALOG_PAGE_OPENED:String = "CATALOG_PAGE_OPENED";
       
      
      private var var_1625:int;
      
      private var var_2773:String;
      
      public function CatalogPageOpenedEvent(param1:int, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(CATALOG_PAGE_OPENED,param3,param4);
         this.var_1625 = param1;
         this.var_2773 = param2;
      }
      
      public function get pageId() : int
      {
         return this.var_1625;
      }
      
      public function get pageLocalization() : String
      {
         return this.var_2773;
      }
   }
}