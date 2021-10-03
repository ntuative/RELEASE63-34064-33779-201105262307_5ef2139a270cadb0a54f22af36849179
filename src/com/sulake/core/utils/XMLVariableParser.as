package com.sulake.core.utils
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class XMLVariableParser
   {
      
      public static const const_157:String = "hex";
      
      public static const const_41:String = "int";
      
      public static const const_275:String = "uint";
      
      public static const const_136:String = "Number";
      
      public static const const_1822:String = "float";
      
      public static const const_38:String = "Boolean";
      
      public static const const_1905:String = "bool";
      
      public static const const_53:String = "String";
      
      public static const const_238:String = "Point";
      
      public static const const_249:String = "Rectangle";
      
      public static const const_142:String = "Array";
      
      public static const const_254:String = "Map";
      
      private static const const_679:String = "key";
      
      private static const TYPE:String = "type";
      
      private static const const_680:String = "value";
      
      private static const const_668:String = "true";
      
      private static const const_1996:String = "ToggleToRandomState";
      
      private static const X:String = "x";
      
      private static const Y:String = "y";
      
      private static const name_5:String = "width";
      
      private static const name_1:String = "height";
      
      private static const const_1585:String = ",";
       
      
      public function XMLVariableParser()
      {
         super();
      }
      
      public static function parseVariableList(param1:XMLList, param2:Map, param3:Array = null) : uint
      {
         var _loc5_:int = 0;
         var _loc4_:uint = param1.length();
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            XMLVariableParser.parseVariableToken(param1[_loc5_],param2,param3);
            _loc5_++;
         }
         return _loc4_;
      }
      
      private static function parseVariableToken(param1:XML, param2:Map, param3:Array = null) : void
      {
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc5_:String = const_53;
         _loc7_ = param1.attribute(const_679);
         if(_loc7_.length() > 0)
         {
            _loc4_ = String(param1.attribute(const_679));
         }
         else
         {
            _loc4_ = param1.child(const_679)[0];
         }
         _loc7_ = param1.attribute(TYPE);
         if(_loc7_.length() > 0)
         {
            _loc5_ = String(param1.attribute(TYPE));
         }
         _loc7_ = param1.attribute(const_680);
         if(_loc7_.length() > 0)
         {
            _loc6_ = String(param1.attribute(const_680));
         }
         if(_loc6_ != null)
         {
            param2[_loc4_] = XMLVariableParser.castStringToType(_loc6_,_loc5_);
         }
         else
         {
            _loc8_ = param1.child(const_680)[0];
            if(_loc8_ != null)
            {
               _loc9_ = _loc8_.child(0)[0];
               _loc6_ = _loc9_.children()[0];
               _loc5_ = _loc9_.localName();
               param2[_loc4_] = XMLVariableParser.parseValueType(_loc9_,_loc5_);
            }
            else if(_loc5_ == const_254 || _loc5_ == const_142)
            {
               param2[_loc4_] = XMLVariableParser.parseValueType(param1,_loc5_);
            }
         }
         if(param3)
         {
            param3.push(_loc5_);
         }
      }
      
      public static function castStringToType(param1:String, param2:String) : Object
      {
         switch(param2)
         {
            case const_275:
               return uint(param1);
            case const_41:
               return int(param1);
            case const_136:
               return Number(param1);
            case const_1822:
               return Number(param1);
            case const_38:
               return param1 == const_668 || int(param1) > 0;
            case const_1905:
               return param1 == const_668 || int(param1) > 0;
            case const_157:
               return uint(param1);
            case const_142:
               return param1.split(const_1585);
            default:
               return String(param1);
         }
      }
      
      public static function parseValueType(param1:XML, param2:String) : Object
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         switch(param2)
         {
            case const_53:
               return String(param1);
            case const_238:
               _loc4_ = new Point();
               _loc4_.x = Number(param1.attribute(X));
               _loc4_.y = Number(param1.attribute(Y));
               return _loc4_;
            case const_249:
               _loc5_ = new Rectangle();
               _loc5_.x = Number(param1.attribute(X));
               _loc5_.y = Number(param1.attribute(Y));
               _loc5_.width = Number(param1.attribute(name_5));
               _loc5_.height = Number(param1.attribute(name_1));
               return _loc5_;
            case const_142:
               _loc3_ = new Map();
               parseVariableList(param1.children(),_loc3_);
               _loc6_ = new Array();
               for(_loc7_ in _loc3_)
               {
                  _loc6_.push(_loc3_[_loc7_]);
               }
               return _loc6_;
            case const_254:
               _loc3_ = new Map();
               XMLVariableParser.parseVariableList(param1.children(),_loc3_);
               return _loc3_;
            default:
               throw new Error("Unable to parse data type \"" + param2 + "\", unknown type!");
         }
      }
   }
}
