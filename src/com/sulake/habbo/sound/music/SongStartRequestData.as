package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1843:int;
      
      private var var_1667:Number;
      
      private var var_2241:Number;
      
      private var var_2242:int;
      
      private var var_2244:Number;
      
      private var var_2243:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1843 = param1;
         this.var_1667 = param2;
         this.var_2241 = param3;
         this.var_2244 = param4;
         this.var_2243 = param5;
         this.var_2242 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1843;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1667 < 0)
         {
            return 0;
         }
         return this.var_1667 + (getTimer() - this.var_2242) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2241;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2244;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2243;
      }
   }
}
