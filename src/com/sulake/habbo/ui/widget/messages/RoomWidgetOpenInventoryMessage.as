package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_713:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1345:String = "inventory_effects";
      
      public static const const_1307:String = "inventory_badges";
      
      public static const const_1774:String = "inventory_clothes";
      
      public static const const_1671:String = "inventory_furniture";
       
      
      private var var_2483:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_713);
         this.var_2483 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2483;
      }
   }
}
