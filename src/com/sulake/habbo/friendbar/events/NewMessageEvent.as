package com.sulake.habbo.friendbar.events
{
   import flash.events.Event;
   
   public class NewMessageEvent extends Event
   {
      
      public static const const_1295:String = "FBE_MESSAGE";
       
      
      public var notify:Boolean;
      
      public function NewMessageEvent(param1:Boolean)
      {
         super(const_1295,false,false);
         this.notify = param1;
      }
   }
}
