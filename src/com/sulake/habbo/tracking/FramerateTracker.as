package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1831:int;
      
      private var var_2520:int;
      
      private var var_790:int;
      
      private var var_555:Number;
      
      private var var_2518:Boolean;
      
      private var var_2519:int;
      
      private var var_1832:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_555);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2520 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2519 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2518 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_790;
         if(this.var_790 == 1)
         {
            this.var_555 = param1;
            this.var_1831 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_790);
            this.var_555 = this.var_555 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2518 && param3 - this.var_1831 >= this.var_2520)
         {
            this.var_790 = 0;
            if(this.var_1832 < this.var_2519)
            {
               param2.track("performance","averageFramerate",this.frameRate);
               ++this.var_1832;
               this.var_1831 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
