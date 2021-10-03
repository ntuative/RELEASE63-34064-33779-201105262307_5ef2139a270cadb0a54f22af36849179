package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_864:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_1108)
         {
            _structure = null;
            _assets = null;
            var_251 = null;
            var_290 = null;
            var_620 = null;
            var_582 = null;
            var_339 = null;
            if(!var_1377 && var_47)
            {
               var_47.dispose();
            }
            var_47 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_736 = null;
            var_1108 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_864[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_864[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_425:
               switch(_loc3_)
               {
                  case AvatarAction.const_822:
                  case AvatarAction.const_540:
                  case AvatarAction.const_428:
                  case AvatarAction.const_957:
                  case AvatarAction.const_389:
                  case AvatarAction.const_736:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_346:
            case AvatarAction.const_946:
            case AvatarAction.const_277:
            case AvatarAction.const_888:
            case AvatarAction.const_841:
            case AvatarAction.const_989:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
