package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_702;
         param1["bitmap"] = const_962;
         param1["border"] = const_956;
         param1["border_notify"] = const_1847;
         param1["bubble"] = const_756;
         param1["bubble_pointer_up"] = const_1294;
         param1["bubble_pointer_right"] = const_1184;
         param1["bubble_pointer_down"] = const_1150;
         param1["bubble_pointer_left"] = const_1324;
         param1["button"] = const_577;
         param1["button_thick"] = const_770;
         param1["button_icon"] = const_1683;
         param1["button_group_left"] = const_805;
         param1["button_group_center"] = const_742;
         param1["button_group_right"] = const_764;
         param1["canvas"] = const_748;
         param1["checkbox"] = const_874;
         param1["closebutton"] = const_1254;
         param1["container"] = const_432;
         param1["container_button"] = const_985;
         param1["display_object_wrapper"] = const_757;
         param1["dropmenu"] = const_491;
         param1["dropmenu_item"] = const_505;
         param1["frame"] = const_423;
         param1["frame_notify"] = const_1738;
         param1["header"] = const_803;
         param1["html"] = const_1316;
         param1["icon"] = const_1342;
         param1["itemgrid"] = const_1239;
         param1["itemgrid_horizontal"] = const_482;
         param1["itemgrid_vertical"] = const_758;
         param1["itemlist"] = const_1302;
         param1["itemlist_horizontal"] = const_440;
         param1["itemlist_vertical"] = const_373;
         param1["label"] = const_798;
         param1["maximizebox"] = const_1745;
         param1["menu"] = const_1935;
         param1["menu_item"] = const_1932;
         param1["submenu"] = const_1349;
         param1["minimizebox"] = const_1842;
         param1["notify"] = const_1686;
         param1["null"] = const_759;
         param1["password"] = const_944;
         param1["radiobutton"] = const_768;
         param1["region"] = const_578;
         param1["restorebox"] = const_1704;
         param1["scaler"] = const_483;
         param1["scaler_horizontal"] = const_1654;
         param1["scaler_vertical"] = const_1691;
         param1["scrollbar_horizontal"] = const_564;
         param1["scrollbar_vertical"] = const_892;
         param1["scrollbar_slider_button_up"] = const_1340;
         param1["scrollbar_slider_button_down"] = const_1347;
         param1["scrollbar_slider_button_left"] = const_1198;
         param1["scrollbar_slider_button_right"] = const_1305;
         param1["scrollbar_slider_bar_horizontal"] = const_1183;
         param1["scrollbar_slider_bar_vertical"] = const_1277;
         param1["scrollbar_slider_track_horizontal"] = const_1193;
         param1["scrollbar_slider_track_vertical"] = const_1256;
         param1["scrollable_itemlist"] = const_1938;
         param1["scrollable_itemlist_vertical"] = WINDOW_TYPE_SCROLLABLE_ITEMLIST_VERTICAL;
         param1["scrollable_itemlist_horizontal"] = const_1243;
         param1["selector"] = const_902;
         param1["selector_list"] = const_728;
         param1["submenu"] = const_1349;
         param1["tab_button"] = const_980;
         param1["tab_container_button"] = const_1291;
         param1["tab_context"] = const_444;
         param1["tab_content"] = const_1227;
         param1["tab_selector"] = const_765;
         param1["text"] = const_732;
         param1["input"] = const_741;
         param1["toolbar"] = const_1764;
         param1["tooltip"] = const_435;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
