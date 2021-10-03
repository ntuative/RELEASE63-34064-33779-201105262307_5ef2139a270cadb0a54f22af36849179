package com.sulake.habbo.friendbar.events
{
   import flash.events.Event;
   
   public class NewRoomEventEvent extends Event
   {
      
      public static const const_1176:String = "FBE_ROOM_EVENT";
       
      
      public var eventCreatorId:String;
      
      public var eventCreatorName:String;
      
      public var roomId:String;
      
      public var message:String;
      
      public function NewRoomEventEvent()
      {
         super(const_1176);
      }
   }
}
