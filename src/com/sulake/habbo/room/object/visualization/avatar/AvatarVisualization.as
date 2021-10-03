package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_1103:String = "avatar";
      
      private static const const_675:Number = -0.01;
      
      private static const const_676:Number = -0.409;
      
      private static const const_1105:int = 2;
      
      private static const const_1627:Array = [0,0,0];
      
      private static const const_1625:int = 3;
       
      
      private var var_688:AvatarVisualizationData = null;
      
      private var var_572:Map;
      
      private var var_565:Map;
      
      private var var_1349:int = 0;
      
      private var var_927:Boolean;
      
      private var var_620:String;
      
      private var var_966:String;
      
      private var var_1350:int = 0;
      
      private var var_689:BitmapDataAsset;
      
      private var var_1084:BitmapDataAsset;
      
      private var var_2087:int = -1;
      
      private var var_2085:int = -1;
      
      private var var_2086:int = -1;
      
      private const const_1104:int = 0;
      
      private const const_2000:int = 1;
      
      private const const_1994:int = 2;
      
      private const const_1995:int = 3;
      
      private const const_1626:int = 4;
      
      private var var_1779:int = -1;
      
      private var var_282:String = "";
      
      private var _postureParameter:String = "";
      
      private var var_2089:Boolean = false;
      
      private var var_2090:Boolean = false;
      
      private var var_2084:Boolean = false;
      
      private var var_1617:Boolean = false;
      
      private var var_586:Boolean = false;
      
      private var var_1618:int = 0;
      
      private var var_1619:int = 0;
      
      private var var_2749:int = 0;
      
      private var var_860:int = 0;
      
      private var var_862:int = 0;
      
      private var var_690:int = 0;
      
      private var var_1620:int = 0;
      
      private var var_1337:Boolean = false;
      
      private var var_2088:Boolean = false;
      
      private var var_1336:int = 0;
      
      private var var_861:int = 0;
      
      private var var_2091:Boolean = false;
      
      private var var_1335:int = 0;
      
      private var var_62:IAvatarImage = null;
      
      private var var_1108:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_572 = new Map();
         this.var_565 = new Map();
         this.var_927 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_572 != null)
         {
            this.resetImages();
            this.var_572.dispose();
            this.var_565.dispose();
            this.var_572 = null;
         }
         this.var_688 = null;
         this.var_689 = null;
         this.var_1084 = null;
         super.dispose();
         this.var_1108 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1108;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_688 = param1 as AvatarVisualizationData;
         createSprites(this.const_1626);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_154)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_242) > 0 && param3);
            if(_loc5_ != this.var_2089)
            {
               this.var_2089 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_438) > 0;
            if(_loc5_ != this.var_2090)
            {
               this.var_2090 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_436) > 0;
            if(_loc5_ != this.var_2084)
            {
               this.var_2084 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_880) > 0 && param3);
            if(_loc5_ != this.var_1617)
            {
               this.var_1617 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_1335) > 0;
            if(_loc5_ != this.var_586)
            {
               this.var_586 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_146);
            if(_loc6_ != this.var_1618)
            {
               this.var_1618 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_265);
            if(_loc7_ != this.var_282)
            {
               this.var_282 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_823);
            if(_loc7_ != this._postureParameter)
            {
               this._postureParameter = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_1274);
            if(_loc6_ != this.var_1619)
            {
               this.var_1619 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_599);
            if(_loc6_ != this.var_860)
            {
               this.var_860 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_629);
            if(_loc6_ != this.var_862)
            {
               this.var_862 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_385);
            if(_loc6_ != this.var_690)
            {
               this.var_690 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_212);
            if(_loc6_ != this.var_2087)
            {
               this.var_2087 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_862 > 0 && param1.getNumber(RoomObjectVariableEnum.const_385) > 0)
            {
               if(this.var_690 != this.var_862)
               {
                  this.var_690 = this.var_862;
                  _loc4_ = true;
               }
            }
            else if(this.var_690 != 0)
            {
               this.var_690 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_744);
            if(_loc6_ != this.var_1336)
            {
               this.var_1336 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.AVATAR_GENDER);
            if(_loc7_ != this.var_966)
            {
               this.var_966 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_209);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            var_154 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this.var_620 != param1)
         {
            this.var_620 = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_572)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         for each(_loc1_ in this.var_565)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_572.reset();
         this.var_565.reset();
         this.var_62 = null;
         _loc2_ = getSprite(this.const_1104);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1617 = false;
         }
         if(this.var_282 == "sit" || this.var_282 == "lay")
         {
            this.var_1620 = param1 / 2;
         }
         else
         {
            this.var_1620 = 0;
         }
         this.var_2088 = false;
         this.var_1337 = false;
         if(this.var_282 == "lay")
         {
            this.var_1337 = true;
            _loc2_ = int(this._postureParameter);
            if(_loc2_ < 0)
            {
               this.var_2088 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : IAvatarImage
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc3_ = this.var_572.getValue(_loc4_) as IAvatarImage;
         }
         else
         {
            _loc4_ += "-" + param2;
            _loc3_ = this.var_565.getValue(_loc4_) as IAvatarImage;
            if(_loc3_)
            {
               _loc3_.forceActionUpdate();
            }
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_688.getAvatar(this.var_620,param1,this.var_966,this);
            if(_loc3_ != null)
            {
               if(param2 == 0)
               {
                  this.var_572.add(_loc4_,_loc3_);
               }
               else
               {
                  if(this.var_565.length >= const_1625)
                  {
                     _loc5_ = this.var_565.remove(this.var_565.getKey(0));
                     if(_loc5_)
                     {
                        _loc5_.dispose();
                     }
                  }
                  this.var_565.add(_loc4_,_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_486 != param1.getUpdateID() || this.var_1779 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_2087;
            if(this.var_282 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_2085 || param4)
            {
               _loc5_ = true;
               this.var_2085 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_62.setDirectionAngle(AvatarSetType.const_35,_loc6_);
            }
            if(_loc7_ != this.var_2086 || param4)
            {
               _loc5_ = true;
               this.var_2086 = _loc7_;
               if(this.var_2086 != this.var_2085)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_62.setDirectionAngle(AvatarSetType.const_52,_loc7_);
               }
            }
            var_486 = param1.getUpdateID();
            this.var_1779 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_2000);
         this.var_689 = null;
         if(this.var_282 == "mv" || this.var_282 == "std")
         {
            _loc2_.visible = true;
            if(this.var_689 == null || param1 != var_94)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  this.var_689 = this.var_62.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  this.var_689 = this.var_62.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(this.var_689 != null)
               {
                  _loc2_.asset = this.var_689.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_689 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_1084 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1994);
         if(this.var_586)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_1084 = this.var_688.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_1084 = this.var_688.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_282 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_282 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_1084 != null)
            {
               _loc2_.asset = this.var_1084.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_1995);
         if(this.var_1336 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_688.getAvatarRendererAsset("number_" + this.var_1336 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_688.getAvatarRendererAsset("number_" + this.var_1336 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_282 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_282 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_861 = 1;
               this.var_2091 = true;
               this.var_1335 = 0;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_861 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1995);
         var _loc3_:int = _loc2_.alpha;
         var _loc4_:Boolean = false;
         if(this.var_2091)
         {
            ++this.var_1335;
            if(this.var_1335 < 10)
            {
               return false;
            }
            if(this.var_861 < 0)
            {
               if(param1 < 48)
               {
                  _loc2_.offsetY -= 2;
               }
               else
               {
                  _loc2_.offsetY -= 4;
               }
            }
            else
            {
               _loc5_ = 4;
               if(param1 < 48)
               {
                  _loc5_ = 8;
               }
               if(this.var_1335 % _loc5_ == 0)
               {
                  --_loc2_.offsetY;
                  _loc4_ = true;
               }
            }
         }
         if(this.var_861 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_861 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_861 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_861 = 0;
               this.var_2091 = false;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc5_:IRoomObject = object;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_688 == null)
         {
            return;
         }
         var _loc6_:IRoomObjectModel = _loc5_.getModel();
         var _loc7_:Number = param1.scale;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:int = this.var_860;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = this.updateModel(_loc6_,_loc7_,param3);
         if(this.animateNumberBubble(_loc7_))
         {
            increaseUpdateId();
         }
         if(_loc13_ || _loc7_ != var_94 || this.var_62 == null)
         {
            if(_loc7_ != var_94)
            {
               _loc9_ = true;
               this.validateActions(_loc7_);
            }
            if(_loc11_ != this.var_860)
            {
               _loc12_ = true;
            }
            if(_loc9_ || this.var_62 == null || _loc12_)
            {
               this.var_62 = this.getAvatarImage(_loc7_,this.var_860);
               if(this.var_62 == null)
               {
                  return;
               }
               _loc8_ = true;
               _loc16_ = getSprite(this.const_1104);
               if(_loc16_ && this.var_62 && this.var_62.isPlaceholder())
               {
                  _loc16_.alpha = 150;
               }
               else if(_loc16_)
               {
                  _loc16_.alpha = 255;
               }
            }
            if(this.var_62 == null)
            {
               return;
            }
            this.updateShadow(_loc7_);
            if(_loc9_)
            {
               this.updateTypingBubble(_loc7_);
               this.updateNumberBubble(_loc7_);
            }
            _loc10_ = this.updateObject(_loc5_,param1,param3,true);
            this.updateActions(this.var_62);
            var_94 = _loc7_;
         }
         else
         {
            _loc10_ = this.updateObject(_loc5_,param1,param3);
         }
         var _loc14_:Boolean = _loc10_ || _loc13_ || _loc9_;
         var _loc15_:Boolean = (this.var_927 || this.var_1350 > 0) && param3;
         if(_loc14_)
         {
            this.var_1350 = const_1105;
         }
         if(_loc14_ || _loc15_)
         {
            increaseUpdateId();
            --this.var_1350;
            --this.var_1349;
            if(!(this.var_1349 <= 0 || _loc9_ || _loc13_ || _loc8_))
            {
               return;
            }
            this.var_62.updateAnimationByFrames(1);
            this.var_1349 = const_1105;
            _loc18_ = this.var_62.getCanvasOffsets();
            if(_loc18_ == null || _loc18_.length < 3)
            {
               _loc18_ = const_1627;
            }
            _loc17_ = getSprite(this.const_1104);
            if(_loc17_ != null)
            {
               _loc21_ = this.var_62.getImage(AvatarSetType.const_35,false);
               if(_loc21_ != null)
               {
                  _loc17_.asset = _loc21_;
               }
               if(_loc17_.asset)
               {
                  _loc17_.offsetX = -1 * _loc7_ / 2 + _loc18_[0];
                  _loc17_.offsetY = -_loc17_.asset.height + _loc7_ / 4 + _loc18_[1] + this.var_1620;
               }
               if(this.var_1337)
               {
                  if(this.var_2088)
                  {
                     _loc17_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc17_.relativeDepth = const_676 + _loc18_[2];
                  }
               }
               else
               {
                  _loc17_.relativeDepth = const_675 + _loc18_[2];
               }
            }
            _loc17_ = getSprite(this.const_1994);
            if(_loc17_ != null && _loc17_.visible)
            {
               if(!this.var_1337)
               {
                  _loc17_.relativeDepth = const_675 - 0.01 + _loc18_[2];
               }
               else
               {
                  _loc17_.relativeDepth = const_676 - 0.01 + _loc18_[2];
               }
            }
            this.var_927 = this.var_62.isAnimating();
            _loc19_ = this.const_1626;
            for each(_loc20_ in this.var_62.getSprites())
            {
               if(_loc20_.id == const_1103)
               {
                  _loc17_ = getSprite(this.const_1104);
                  _loc22_ = this.var_62.getLayerData(_loc20_);
                  _loc23_ = _loc20_.getDirectionOffsetX(this.var_62.getDirection());
                  _loc24_ = _loc20_.getDirectionOffsetY(this.var_62.getDirection());
                  if(_loc22_ != null)
                  {
                     _loc23_ += _loc22_.dx;
                     _loc24_ += _loc22_.dy;
                  }
                  if(_loc7_ < 48)
                  {
                     _loc23_ /= 2;
                     _loc24_ /= 2;
                  }
                  _loc17_.offsetX += _loc23_;
                  _loc17_.offsetY += _loc24_;
               }
               else
               {
                  _loc17_ = getSprite(_loc19_);
                  if(_loc17_ != null)
                  {
                     _loc17_.capturesMouse = false;
                     _loc17_.visible = true;
                     _loc25_ = this.var_62.getLayerData(_loc20_);
                     _loc26_ = 0;
                     _loc27_ = _loc20_.getDirectionOffsetX(this.var_62.getDirection());
                     _loc28_ = _loc20_.getDirectionOffsetY(this.var_62.getDirection());
                     _loc29_ = _loc20_.getDirectionOffsetZ(this.var_62.getDirection());
                     _loc30_ = 0;
                     if(_loc20_.hasDirections)
                     {
                        _loc30_ = this.var_62.getDirection();
                     }
                     if(_loc25_ != null)
                     {
                        _loc26_ = _loc25_.animationFrame;
                        _loc27_ += _loc25_.dx;
                        _loc28_ += _loc25_.dy;
                        _loc30_ += _loc25_.directionOffset;
                     }
                     if(_loc7_ < 48)
                     {
                        _loc27_ /= 2;
                        _loc28_ /= 2;
                     }
                     if(_loc30_ < 0)
                     {
                        _loc30_ += 8;
                     }
                     else if(_loc30_ > 7)
                     {
                        _loc30_ -= 8;
                     }
                     _loc31_ = this.var_62.getScale() + "_" + _loc20_.member + "_" + _loc30_ + "_" + _loc26_;
                     _loc32_ = this.var_62.getAsset(_loc31_);
                     if(_loc32_ == null)
                     {
                        continue;
                     }
                     _loc17_.asset = _loc32_.content as BitmapData;
                     _loc17_.offsetX = -_loc32_.offset.x - _loc7_ / 2 + _loc27_;
                     _loc17_.offsetY = -_loc32_.offset.y + _loc28_ + this.var_1620;
                     if(this.var_1337)
                     {
                        _loc17_.relativeDepth = const_676 - 0.001 * spriteCount * _loc29_;
                     }
                     else
                     {
                        _loc17_.relativeDepth = const_675 - 0.001 * spriteCount * _loc29_;
                     }
                     if(_loc20_.ink == 33)
                     {
                        _loc17_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc17_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc19_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_425,this.var_282,this._postureParameter);
         if(this.var_1618 > 0)
         {
            param1.appendAction(AvatarAction.const_348,AvatarAction.const_1646[this.var_1618]);
         }
         if(this.var_1619 > 0)
         {
            param1.appendAction(AvatarAction.const_946,this.var_1619);
         }
         if(this.var_2749 > 0)
         {
            param1.appendAction(AvatarAction.const_888,this.var_2749);
         }
         if(this.var_862 > 0)
         {
            param1.appendAction(AvatarAction.const_841,this.var_862);
         }
         if(this.var_690 > 0)
         {
            param1.appendAction(AvatarAction.const_989,this.var_690);
         }
         if(this.var_2089)
         {
            param1.appendAction(AvatarAction.const_360);
         }
         if(this.var_2084 || this.var_1617)
         {
            param1.appendAction(AvatarAction.const_509);
         }
         if(this.var_2090)
         {
            param1.appendAction(AvatarAction.const_277);
         }
         if(this.var_860 > 0)
         {
            param1.appendAction(AvatarAction.const_346,this.var_860);
         }
         param1.endActionAppends();
         this.var_927 = param1.isAnimating();
         var _loc2_:int = this.const_1626;
         for each(_loc3_ in this.var_62.getSprites())
         {
            if(_loc3_.id != const_1103)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}
