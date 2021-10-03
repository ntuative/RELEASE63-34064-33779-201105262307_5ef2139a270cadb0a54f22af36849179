package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1884:int;
      
      private var _name:String;
      
      private var var_1112:int;
      
      private var var_2692:int;
      
      private var var_2597:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_620:String;
      
      private var var_2693:int;
      
      private var var_2695:int;
      
      private var var_2694:int;
      
      private var var_2625:int;
      
      private var var_2411:int;
      
      private var _ownerName:String;
      
      private var var_495:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1884;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1112;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2692;
      }
      
      public function get experience() : int
      {
         return this.var_2597;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_620;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2693;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2695;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2694;
      }
      
      public function get respect() : int
      {
         return this.var_2625;
      }
      
      public function get ownerId() : int
      {
         return this.var_2411;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_495;
      }
      
      public function flush() : Boolean
      {
         this.var_1884 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1884 = param1.readInteger();
         this._name = param1.readString();
         this.var_1112 = param1.readInteger();
         this.var_2692 = param1.readInteger();
         this.var_2597 = param1.readInteger();
         this.var_2693 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2695 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2694 = param1.readInteger();
         this.var_620 = param1.readString();
         this.var_2625 = param1.readInteger();
         this.var_2411 = param1.readInteger();
         this.var_495 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
