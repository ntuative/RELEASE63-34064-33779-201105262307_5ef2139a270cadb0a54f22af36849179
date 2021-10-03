package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_843:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2414:int;
      
      private var var_2413:int;
      
      private var _color:uint;
      
      private var var_1311:int;
      
      private var var_2415:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_843);
         this.var_2414 = param1;
         this.var_2413 = param2;
         this._color = param3;
         this.var_1311 = param4;
         this.var_2415 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2414;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2413;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1311;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2415;
      }
   }
}
