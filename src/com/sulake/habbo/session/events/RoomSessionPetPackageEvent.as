package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPetPackageEvent extends RoomSessionEvent
   {
      
      public static const const_500:String = "RSOPPE_OPEN_PET_PACKAGE_REQUESTED";
      
      public static const const_627:String = "RSOPPE_OPEN_PET_PACKAGE_RESULT";
       
      
      private var var_219:int = -1;
      
      private var var_1224:int = -1;
      
      private var var_1727:int = -1;
      
      private var _color:String = "";
      
      private var var_2107:int = 0;
      
      private var var_2108:String = null;
      
      public function RoomSessionPetPackageEvent(param1:String, param2:IRoomSession, param3:int, param4:int, param5:int, param6:String, param7:int, param8:String, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param2,param9,param10);
         this.var_219 = param3;
         this.var_1224 = param4;
         this.var_1727 = param5;
         this._color = param6;
         this.var_2107 = param7;
         this.var_2108 = param8;
      }
      
      public function get objectId() : int
      {
         return this.var_219;
      }
      
      public function get petType() : int
      {
         return this.var_1224;
      }
      
      public function get breed() : int
      {
         return this.var_1727;
      }
      
      public function get color() : String
      {
         return this._color;
      }
      
      public function get nameValidationStatus() : int
      {
         return this.var_2107;
      }
      
      public function get nameValidationInfo() : String
      {
         return this.var_2108;
      }
   }
}
