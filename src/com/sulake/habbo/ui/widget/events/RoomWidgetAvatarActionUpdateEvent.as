package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetAvatarActionUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_812:String = "RWBIUE_AVATAR_ACTION";
      
      public static const EFFECT_ACTIVE:String = "EFFECT_ACTIVE";
      
      public static const EFFECT_INACTIVE:String = "EFFECT_INACTIVE";
       
      
      private var var_1729:String = "";
      
      public function RoomWidgetAvatarActionUpdateEvent(param1:String, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_812,param3,param4);
         switch(param1)
         {
            case "fx":
               if(param2 == "0")
               {
                  this.var_1729 = EFFECT_INACTIVE;
               }
               else
               {
                  this.var_1729 = EFFECT_ACTIVE;
               }
               break;
            default:
               Logger.log("RoomWidgetAvatarActionUpdateEvent, unknown actiontype: " + param1);
         }
      }
      
      public function get actionType() : String
      {
         return this.var_1729;
      }
   }
}
