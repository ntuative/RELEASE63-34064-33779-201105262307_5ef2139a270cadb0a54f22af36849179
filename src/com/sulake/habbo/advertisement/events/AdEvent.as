package com.sulake.habbo.advertisement.events
{
   import flash.display.BitmapData;
   import flash.events.Event;
   
   public class AdEvent extends Event
   {
      
      public static const const_882:String = "AE_ROOM_AD_IMAGE_LOADED";
      
      public static const const_949:String = "AE_ROOM_AD_IMAGE_LOADING_FAILED";
      
      public static const const_561:String = "AE_ROOM_AD_SHOW";
      
      public static const const_464:String = "AE_INTERSTITIAL_SHOW";
      
      public static const const_516:String = "AE_INTERSTITIAL_COMPLETE";
       
      
      private var var_47:BitmapData;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var _imageUrl:String;
      
      private var var_1251:String;
      
      private var var_2284:BitmapData;
      
      private var var_2283:BitmapData;
      
      private var var_219:int;
      
      public function AdEvent(param1:String, param2:int = 0, param3:int = 0, param4:BitmapData = null, param5:String = "", param6:String = "", param7:BitmapData = null, param8:BitmapData = null, param9:int = -1, param10:Boolean = false, param11:Boolean = false)
      {
         super(param1,param10,param11);
         this.var_47 = param4;
         this._roomId = param2;
         this._roomCategory = param3;
         this._imageUrl = param5;
         this.var_1251 = param6;
         this.var_2284 = param7;
         this.var_2283 = param8;
         this.var_219 = param9;
      }
      
      public function get image() : BitmapData
      {
         return this.var_47;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get imageUrl() : String
      {
         return this._imageUrl;
      }
      
      public function get clickUrl() : String
      {
         return this.var_1251;
      }
      
      public function get adWarningL() : BitmapData
      {
         return this.var_2284;
      }
      
      public function get adWarningR() : BitmapData
      {
         return this.var_2283;
      }
      
      public function get objectId() : int
      {
         return this.var_219;
      }
   }
}
