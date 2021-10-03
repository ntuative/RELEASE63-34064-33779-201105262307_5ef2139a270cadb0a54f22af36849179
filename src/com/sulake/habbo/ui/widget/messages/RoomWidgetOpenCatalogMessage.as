package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_410:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1195:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1318:String = "RWOCM_PIXELS";
      
      public static const const_1271:String = "RWOCM_CREDITS";
       
      
      private var var_2312:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_410);
         this.var_2312 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2312;
      }
   }
}
