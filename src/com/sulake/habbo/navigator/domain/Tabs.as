package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_308:int = 1;
      
      public static const const_201:int = 2;
      
      public static const const_276:int = 3;
      
      public static const const_327:int = 4;
      
      public static const const_211:int = 5;
      
      public static const const_384:int = 1;
      
      public static const const_813:int = 2;
      
      public static const const_751:int = 3;
      
      public static const const_708:int = 4;
      
      public static const const_264:int = 5;
      
      public static const const_785:int = 6;
      
      public static const const_788:int = 7;
      
      public static const const_289:int = 8;
      
      public static const const_419:int = 9;
      
      public static const const_2163:int = 10;
      
      public static const const_943:int = 11;
      
      public static const const_499:int = 12;
       
      
      private var var_423:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_423 = new Array();
         this.var_423.push(new Tab(this._navigator,const_308,const_499,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_624));
         this.var_423.push(new Tab(this._navigator,const_201,const_384,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_624));
         this.var_423.push(new Tab(this._navigator,const_327,const_943,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1181));
         this.var_423.push(new Tab(this._navigator,const_276,const_264,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_624));
         this.var_423.push(new Tab(this._navigator,const_211,const_289,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_814));
         this.setSelectedTab(const_308);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_327;
      }
      
      public function get tabs() : Array
      {
         return this.var_423;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_423)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_423)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_423)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
