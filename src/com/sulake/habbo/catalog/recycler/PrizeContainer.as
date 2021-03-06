package com.sulake.habbo.catalog.recycler
{
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   
   public class PrizeContainer extends PrizeGridItem
   {
       
      
      private var var_2621:String;
      
      private var var_2098:int;
      
      private var var_2918:int;
      
      private var _furnitureData:IFurnitureData;
      
      private var var_2994:PrizeGridItem;
      
      public function PrizeContainer(param1:String, param2:int, param3:IFurnitureData, param4:int)
      {
         super();
         this.var_2621 = param1;
         this.var_2098 = param2;
         this._furnitureData = param3;
         this.var_2918 = param4;
      }
      
      public function setIcon(param1:IRoomEngine) : void
      {
         if(param1 == null || this._furnitureData == null)
         {
            return;
         }
         initProductIcon(param1,this._furnitureData.type,this.var_2098);
      }
      
      public function get productItemType() : String
      {
         return this.var_2621;
      }
      
      public function get productItemTypeId() : int
      {
         return this.var_2098;
      }
      
      public function get gridItem() : PrizeGridItem
      {
         return this.var_2994;
      }
      
      public function get oddsLevelId() : int
      {
         return this.var_2918;
      }
      
      public function get title() : String
      {
         if(this._furnitureData == null)
         {
            return "";
         }
         return this._furnitureData.title;
      }
   }
}
