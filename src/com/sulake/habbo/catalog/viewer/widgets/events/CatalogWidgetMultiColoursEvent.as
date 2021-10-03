package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetMultiColoursEvent extends Event
   {
       
      
      private var var_924:Array;
      
      private var var_2631:String;
      
      private var var_2633:String;
      
      private var var_2632:String;
      
      public function CatalogWidgetMultiColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_MULTI_COLOUR_ARRAY,param5,param6);
         this.var_924 = param1;
         this.var_2631 = param2;
         this.var_2633 = param3;
         this.var_2632 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_924;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2631;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2633;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2632;
      }
   }
}
