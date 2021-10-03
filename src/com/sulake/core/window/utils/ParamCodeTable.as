package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_194;
         param1["bound_to_parent_rect"] = const_102;
         param1["child_window"] = const_1255;
         param1["embedded_controller"] = const_1338;
         param1["resize_to_accommodate_children"] = WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_686;
         param1["mouse_dragging_target"] = const_262;
         param1["mouse_dragging_trigger"] = const_387;
         param1["mouse_scaling_target"] = const_341;
         param1["mouse_scaling_trigger"] = const_480;
         param1["horizontal_mouse_scaling_trigger"] = const_240;
         param1["vertical_mouse_scaling_trigger"] = const_284;
         param1["observe_parent_input_events"] = const_1221;
         param1["optimize_region_to_layout_size"] = const_575;
         param1["parent_window"] = const_1120;
         param1["relative_horizontal_scale_center"] = const_206;
         param1["relative_horizontal_scale_fixed"] = const_166;
         param1["relative_horizontal_scale_move"] = const_396;
         param1["relative_horizontal_scale_strech"] = const_414;
         param1["relative_scale_center"] = const_1203;
         param1["relative_scale_fixed"] = const_718;
         param1["relative_scale_move"] = const_1192;
         param1["relative_scale_strech"] = const_1293;
         param1["relative_vertical_scale_center"] = const_217;
         param1["relative_vertical_scale_fixed"] = const_145;
         param1["relative_vertical_scale_move"] = const_290;
         param1["relative_vertical_scale_strech"] = const_316;
         param1["on_resize_align_left"] = const_717;
         param1["on_resize_align_right"] = const_467;
         param1["on_resize_align_center"] = const_504;
         param1["on_resize_align_top"] = const_988;
         param1["on_resize_align_bottom"] = const_597;
         param1["on_resize_align_middle"] = const_470;
         param1["on_accommodate_align_left"] = const_1253;
         param1["on_accommodate_align_right"] = const_613;
         param1["on_accommodate_align_center"] = const_694;
         param1["on_accommodate_align_top"] = const_1240;
         param1["on_accommodate_align_bottom"] = const_485;
         param1["on_accommodate_align_middle"] = const_959;
         param1["route_input_events_to_parent"] = const_572;
         param1["use_parent_graphic_context"] = const_34;
         param1["draggable_with_mouse"] = const_1117;
         param1["scalable_with_mouse"] = const_1111;
         param1["reflect_horizontal_resize_to_parent"] = const_587;
         param1["reflect_vertical_resize_to_parent"] = const_536;
         param1["reflect_resize_to_parent"] = const_332;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1327;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
