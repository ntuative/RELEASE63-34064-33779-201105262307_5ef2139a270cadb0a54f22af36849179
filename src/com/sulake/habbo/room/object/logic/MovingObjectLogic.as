package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class MovingObjectLogic extends ObjectLogicBase
   {
      
      public static const const_904:int = 500;
      
      private static var var_655:Vector3d = new Vector3d();
       
      
      private var var_454:Vector3d;
      
      private var var_95:Vector3d;
      
      private var var_1018:Number = 0.0;
      
      private var var_1937:int = 0;
      
      private var var_2678:int;
      
      private var var_1017:int = 500;
      
      public function MovingObjectLogic()
      {
         this.var_454 = new Vector3d();
         this.var_95 = new Vector3d();
         super();
      }
      
      protected function get lastUpdateTime() : int
      {
         return this.var_1937;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_95 = null;
         this.var_454 = null;
      }
      
      override public function set object(param1:IRoomObjectController) : void
      {
         super.object = param1;
         if(param1 != null)
         {
            this.var_95.assign(param1.getLocation());
         }
      }
      
      protected function set moveUpdateInterval(param1:int) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         this.var_1017 = param1;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         if(param1.loc != null)
         {
            this.var_95.assign(param1.loc);
         }
         var _loc2_:RoomObjectMoveUpdateMessage = param1 as RoomObjectMoveUpdateMessage;
         if(_loc2_ == null)
         {
            return;
         }
         if(object != null)
         {
            if(param1.loc != null)
            {
               _loc3_ = _loc2_.targetLoc;
               this.var_2678 = this.var_1937;
               this.var_454.assign(_loc3_);
               this.var_454.sub(this.var_95);
            }
         }
      }
      
      protected function getLocationOffset() : IVector3d
      {
         return null;
      }
      
      override public function update(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:IVector3d = this.getLocationOffset();
         var _loc3_:IRoomObjectModelController = object.getModelController();
         if(_loc3_ != null)
         {
            if(_loc2_ != null)
            {
               if(this.var_1018 != _loc2_.z)
               {
                  this.var_1018 = _loc2_.z;
                  _loc3_.setNumber(RoomObjectVariableEnum.const_792,this.var_1018);
               }
            }
            else if(this.var_1018 != 0)
            {
               this.var_1018 = 0;
               _loc3_.setNumber(RoomObjectVariableEnum.const_792,this.var_1018);
            }
         }
         if(this.var_454.length > 0 || _loc2_ != null)
         {
            _loc4_ = param1 - this.var_2678;
            if(_loc4_ == this.var_1017 >> 1)
            {
               _loc4_++;
            }
            if(_loc4_ > this.var_1017)
            {
               _loc4_ = this.var_1017;
            }
            if(this.var_454.length > 0)
            {
               var_655.assign(this.var_454);
               var_655.mul(_loc4_ / Number(this.var_1017));
               var_655.add(this.var_95);
            }
            else
            {
               var_655.assign(this.var_95);
            }
            if(_loc2_ != null)
            {
               var_655.add(_loc2_);
            }
            if(object != null)
            {
               object.setLocation(var_655);
            }
            if(_loc4_ == this.var_1017)
            {
               this.var_454.x = 0;
               this.var_454.y = 0;
               this.var_454.z = 0;
            }
         }
         this.var_1937 = param1;
      }
   }
}
