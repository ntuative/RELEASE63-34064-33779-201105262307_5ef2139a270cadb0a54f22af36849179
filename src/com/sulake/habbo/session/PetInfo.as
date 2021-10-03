package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1884:int;
      
      private var var_1112:int;
      
      private var var_2593:int;
      
      private var var_2597:int;
      
      private var var_2595:int;
      
      private var _energy:int;
      
      private var var_2594:int;
      
      private var _nutrition:int;
      
      private var var_2599:int;
      
      private var var_2411:int;
      
      private var _ownerName:String;
      
      private var var_2625:int;
      
      private var var_495:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1884;
      }
      
      public function get level() : int
      {
         return this.var_1112;
      }
      
      public function get levelMax() : int
      {
         return this.var_2593;
      }
      
      public function get experience() : int
      {
         return this.var_2597;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2595;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2594;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2599;
      }
      
      public function get ownerId() : int
      {
         return this.var_2411;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2625;
      }
      
      public function get age() : int
      {
         return this.var_495;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1884 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1112 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2593 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2597 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2595 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2594 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2599 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_2411 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2625 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_495 = param1;
      }
   }
}
