package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.AssetLibraryCollection;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.animation.IAnimationManager;
   import com.sulake.habbo.avatar.enum.AvatarRenderEvent;
   import com.sulake.habbo.avatar.enum.AvatarRendererUpdateEvent;
   import com.sulake.habbo.avatar.enum.AvatarType;
   import com.sulake.habbo.avatar.enum.RenderMode;
   import com.sulake.habbo.avatar.palette.PaletteManager;
   import com.sulake.habbo.avatar.pets.IPetDataManager;
   import com.sulake.habbo.avatar.pets.PetDataManager;
   import com.sulake.habbo.avatar.structure.AvatarStructureDownload;
   import com.sulake.habbo.avatar.structure.IFigureData;
   import com.sulake.habbo.avatar.structure.IStructureData;
   import com.sulake.habbo.avatar.structure.figure.IFigurePartSet;
   import com.sulake.habbo.avatar.structure.figure.ISetType;
   import com.sulake.habbo.avatar.structure.parts.PartOffsetData;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   
   public class AvatarRenderManager extends Component implements IAvatarRenderManager
   {
       
      
      private const const_2253:String = "hd-99999-99999";
      
      private var var_317:AssetAliasCollection;
      
      private var var_109:Map;
      
      private var var_195:IHabboConfigurationManager;
      
      private var var_315:PetDataManager;
      
      private var var_805:PaletteManager;
      
      private var var_336:String;
      
      private var var_316:Map;
      
      private var var_235:AvatarAssetDownloadManager;
      
      private var var_1915:AvatarFigureContainer;
      
      private var var_2645:Boolean = false;
      
      private var var_2646:Boolean = false;
      
      private var var_2647:Boolean = false;
      
      private var var_933:Boolean = false;
      
      public function AvatarRenderManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var _loc4_:* = null;
         param2 |= const_1144;
         super(param1,param2,param3);
         this.var_336 = RenderMode.const_1787;
         this.var_316 = new Map();
         this.var_109 = new Map();
         _loc4_ = new AvatarStructure(this,AvatarType.const_118,PartOffsetData.getInstance(param1.assets));
         _loc4_.initGeometry(param3.getAssetByName("HabboAvatarGeometry").content as XML);
         _loc4_.initActions(param3,param3.getAssetByName("HabboAvatarActions").content as XML);
         _loc4_.initPartSets(param3.getAssetByName("HabboAvatarPartSets").content as XML);
         _loc4_.initAnimation(param3.getAssetByName("HabboAvatarAnimation").content as XML);
         _loc4_.initFigureData(param3.getAssetByName("HabboAvatarFigure").content as XML);
         this.var_109.add(AvatarType.const_118,_loc4_);
         _loc4_ = new AvatarStructure(this,AvatarType.const_58,PartOffsetData.getInstance(param1.assets));
         _loc4_.initGeometry(param3.getAssetByName("HabboAvatarPetGeometry").content as XML);
         _loc4_.initActions(param3,param3.getAssetByName("HabboAvatarPetActions").content as XML);
         _loc4_.initPartSets(param3.getAssetByName("HabboAvatarPetPartSets").content as XML);
         _loc4_.initAnimation(param3.getAssetByName("HabboAvatarPetAnimation").content as XML);
         _loc4_.initFigureData(param3.getAssetByName("HabboAvatarPetFigure").content as XML);
         this.var_109.add(AvatarType.const_58,_loc4_);
         this.var_317 = new AssetAliasCollection(this,param1.assets as AssetLibraryCollection);
         this.var_315 = new PetDataManager(this,param1.assets as AssetLibraryCollection);
         this.var_805 = new PaletteManager(param1.assets as AssetLibraryCollection);
         var _loc5_:XML = param3.getAssetByName("HabboAvatarPetFigure").content as XML;
         this.var_315.populateFigureData(_loc5_);
         param1.events.addEventListener(Component.COMPONENT_EVENT_RUNNING,this.onAllModulesReadyAndRunning);
         lock();
         queueInterface(new IIDHabboConfigurationManager(),this.onHabboConfigurationReady);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_195)
         {
            this.var_195.release(new IIDHabboConfigurationManager());
            this.var_195 = null;
         }
         super.dispose();
         if(this.var_109 != null)
         {
            for each(_loc1_ in this.var_109.getValues())
            {
               _loc1_.dispose();
            }
            this.var_109.dispose();
            this.var_109 = null;
         }
         if(this.var_315 != null)
         {
            this.var_315.dispose();
            this.var_315 = null;
         }
         if(this.var_805 != null)
         {
            this.var_805.dispose();
            this.var_805 = null;
         }
         if(this.var_317 != null)
         {
            this.var_317.dispose();
            this.var_317 = null;
         }
         if(this.var_316)
         {
            this.var_316.dispose();
            this.var_316 = null;
         }
         if(this.var_235)
         {
            this.var_235.removeEventListener(Event.COMPLETE,this.onAvatarAssetsDownloadManagerReady);
            this.var_235.dispose();
            this.var_235 = null;
         }
         PartOffsetData.dispose();
      }
      
      private function onAllModulesReadyAndRunning(param1:Event) : void
      {
         var _loc2_:* = null;
         this.var_317.init();
         this.var_315.init();
         this.var_805.init();
         _loc2_ = this.var_109.getValue(AvatarType.const_118) as AvatarStructure;
         if(_loc2_)
         {
            _loc2_.resetPartOffsets(context.assets);
            _loc2_.registerAnimations(context.assets as AssetLibraryCollection,"fx",200);
            _loc2_.registerAnimations(context.assets as AssetLibraryCollection,"dance",200);
         }
         _loc2_ = this.var_109.getValue(AvatarType.const_58) as AvatarStructure;
         if(_loc2_)
         {
            _loc2_.resetPartOffsets(context.assets);
         }
         this.var_2645 = true;
         this.events.dispatchEvent(new Event(AvatarRendererUpdateEvent.AVATAR_RENDERER_ANIMATIONS_INITIALIZED_EVENT));
         this.checkIfReady();
      }
      
      private function onHabboConfigurationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param2 != null)
         {
            this.var_195 = param2 as IHabboConfigurationManager;
            _loc3_ = this.var_109.getValue(AvatarType.const_118) as AvatarStructure;
            if(_loc3_ != null)
            {
               _loc4_ = this.var_195.getKey("external.figurepartlist.txt","figure.xml");
               if(assets.hasAsset(_loc4_))
               {
                  assets.removeAsset(assets.getAssetByName(_loc4_));
               }
               _loc5_ = new AvatarStructureDownload(assets,_loc4_,_loc3_.figureData as IStructureData);
               _loc5_.addEventListener(AvatarStructureDownload.STRUCTURE_DONE,this.onFigureDataDownloadDone);
               if(this.var_235 == null)
               {
                  Logger.log("[AvatarRenderManager] Init Avatar Assets Download Manager");
                  _loc6_ = this.var_195.getKey("flash.dynamic.avatar.download.configuration","figuremap.xml");
                  _loc7_ = this.var_195.getKey("flash.dynamic.avatar.download.url","");
                  this.var_235 = new AvatarAssetDownloadManager(context.assets,_loc6_,_loc7_,_loc3_);
                  this.var_235.addEventListener(Event.COMPLETE,this.onAvatarAssetsDownloadManagerReady);
               }
            }
         }
      }
      
      private function onFigureDataDownloadDone(param1:Event = null) : void
      {
         Logger.log("[object AvatarRenderManager] Figure Data Download Done");
         this.var_2647 = true;
         this.checkIfReady();
      }
      
      private function onAvatarAssetsDownloadManagerReady(param1:Event = null) : void
      {
         this.var_2646 = true;
         this.checkIfReady();
      }
      
      private function checkIfReady() : void
      {
         if(!this.var_933)
         {
            if(this.var_2645 && this.var_2646 && this.var_2647)
            {
               unlock();
               this.var_933 = true;
               this.events.dispatchEvent(new Event(AvatarRenderEvent.AVATAR_RENDER_READY));
            }
         }
      }
      
      public function createFigureContainer(param1:String) : IAvatarFigureContainer
      {
         return new AvatarFigureContainer(param1);
      }
      
      public function isFigureReady(param1:IAvatarFigureContainer) : Boolean
      {
         if(!this.var_235)
         {
            return false;
         }
         return this.var_235.isReady(param1);
      }
      
      public function downloadFigure(param1:IAvatarFigureContainer, param2:IAvatarImageListener) : void
      {
         if(!this.var_235)
         {
            return;
         }
         this.var_235.loadFigureSetData(param1,param2);
      }
      
      public function createAvatarImage(param1:String, param2:String, param3:String = null, param4:IAvatarImageListener = null) : IAvatarImage
      {
         var _loc5_:AvatarStructure = this.var_109.getValue(AvatarType.const_118) as AvatarStructure;
         if(_loc5_ == null)
         {
            return null;
         }
         if(!this.var_235)
         {
            return null;
         }
         var _loc6_:AvatarFigureContainer = new AvatarFigureContainer(param1);
         if(param3)
         {
            this.validateAvatarFigure(_loc6_,param3);
         }
         if(this.var_235.isReady(_loc6_))
         {
            return new AvatarImage(_loc5_,this.var_317,_loc6_,param2);
         }
         if(!this.var_1915)
         {
            this.var_1915 = new AvatarFigureContainer(this.const_2253);
         }
         this.var_235.loadFigureSetData(_loc6_,param4);
         return new PlaceholderAvatarImage(_loc5_,this.var_317,this.var_1915,param2);
      }
      
      public function removePetImageListener(param1:IPetImageListener) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(param1 == null || this.var_316 == null)
         {
            return;
         }
         for each(_loc2_ in this.var_316.getKeys())
         {
            _loc3_ = this.var_316.getValue(_loc2_);
            if(_loc3_ != null)
            {
               _loc4_ = _loc3_.indexOf(param1);
               if(_loc4_ != -1)
               {
                  _loc3_.splice(_loc4_,1);
               }
            }
         }
      }
      
      public function createPetImageFromFigure(param1:String, param2:String, param3:IPetImageListener = null) : IAvatarImage
      {
         if(param1.indexOf(" ") == -1)
         {
            return null;
         }
         var _loc4_:Array = param1.split(" ");
         if(_loc4_.length == 0)
         {
            return null;
         }
         var _loc5_:int = int(_loc4_[0]);
         var _loc6_:int = int(_loc4_[1]);
         var _loc7_:uint = parseInt(_loc4_[2],16);
         return this.createPetImage(_loc5_,_loc6_,_loc7_,param2,param3);
      }
      
      public function getPetFigureString(param1:String) : String
      {
         if(param1.indexOf(" ") == -1)
         {
            return null;
         }
         var _loc2_:Array = param1.split(" ");
         if(_loc2_.length == 0)
         {
            return null;
         }
         var _loc3_:int = int(_loc2_[0]);
         var _loc4_:int = int(_loc2_[1]);
         var _loc5_:uint = parseInt(_loc2_[2],16);
         return this.var_315.createPetFigureString(_loc3_,_loc4_,_loc5_);
      }
      
      public function createPetImage(param1:int, param2:int, param3:uint, param4:String, param5:IPetImageListener = null) : IAvatarImage
      {
         var _loc9_:* = null;
         var _loc6_:* = false;
         if(this.mode != RenderMode.const_1839)
         {
            _loc6_ = !this.var_315.assetsReady(param1,param4);
         }
         var _loc7_:String = this.var_315.createPetFigureString(param1,param2,param3);
         var _loc8_:AvatarStructure = this.var_109.getValue(AvatarType.const_58) as AvatarStructure;
         if(_loc8_ == null)
         {
            return null;
         }
         if(!_loc6_)
         {
            return new PetImage(_loc8_,this.var_317,_loc7_,param4);
         }
         if(param5 != null)
         {
            _loc9_ = this.var_316[_loc7_];
            if(!_loc9_)
            {
               _loc9_ = [];
            }
            if(_loc9_.indexOf(param5) == -1)
            {
               _loc9_.push(param5);
            }
            this.var_316.add(_loc7_,_loc9_);
         }
         return new PlaceholderPetImage(_loc8_,this.var_317,_loc7_,param4,assets);
      }
      
      public function resetPetData() : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         this.var_317.reset();
         this.var_315.reset();
         this.var_805.reset();
         var _loc1_:XML = assets.getAssetByName("HabboAvatarPetFigure").content as XML;
         this.var_315.populateFigureData(_loc1_);
         var _loc2_:AvatarStructure = this.var_109.getValue(AvatarType.const_58);
         _loc2_.initFigureData(_loc1_);
         _loc2_.resetPartOffsets(context.assets);
         var _loc5_:Array = this.var_316.getKeys();
         for each(_loc6_ in _loc5_)
         {
            _loc4_ = this.var_316.getValue(_loc6_);
            if(_loc4_)
            {
               for each(_loc3_ in _loc4_)
               {
                  if(_loc3_ != null && !_loc3_.disposed)
                  {
                     _loc3_.petImageReady(_loc6_);
                  }
               }
            }
         }
         this.var_316.reset();
      }
      
      public function getFigureData(param1:String) : IFigureData
      {
         var _loc2_:AvatarStructure = this.var_109.getValue(param1) as AvatarStructure;
         if(_loc2_ != null)
         {
            return _loc2_.figureData;
         }
         return null;
      }
      
      public function getAnimationManager(param1:String) : IAnimationManager
      {
         var _loc2_:AvatarStructure = this.var_109.getValue(param1) as AvatarStructure;
         if(_loc2_ != null)
         {
            return _loc2_.animationManager;
         }
         return null;
      }
      
      public function getMandatoryAvatarPartSetIds(param1:String, param2:int) : Array
      {
         var _loc3_:AvatarStructure = this.var_109.getValue(AvatarType.const_118) as AvatarStructure;
         return _loc3_.getMandatorySetTypeIds(param1,param2);
      }
      
      public function getAssetByName(param1:String) : IAsset
      {
         return this.var_317.getAssetByName(param1);
      }
      
      public function get petDataManager() : IPetDataManager
      {
         return this.var_315 as IPetDataManager;
      }
      
      public function get paletteManager() : PaletteManager
      {
         return this.var_805;
      }
      
      public function get mode() : String
      {
         return this.var_336;
      }
      
      public function set mode(param1:String) : void
      {
         this.var_336 = param1;
      }
      
      public function injectFigureData(param1:String, param2:XML) : void
      {
         var _loc3_:* = null;
         switch(param1)
         {
            case AvatarType.const_118:
               _loc3_ = this.var_109.getValue(AvatarType.const_118) as AvatarStructure;
               break;
            case AvatarType.const_58:
               _loc3_ = this.var_109.getValue(AvatarType.const_58) as AvatarStructure;
               break;
            default:
               Logger.log("Uknown avatar type: " + param1);
         }
         if(_loc3_ != null)
         {
            _loc3_.injectFigureData(param2);
         }
      }
      
      private function validateAvatarFigure(param1:AvatarFigureContainer, param2:String) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         if(!this.var_109)
         {
            ErrorReportStorage.addDebugData("AvatarRenderManager","validateAvatarFigure: _structures is null!");
         }
         var _loc3_:AvatarStructure = this.var_109.getValue(AvatarType.const_118) as AvatarStructure;
         if(!_loc3_)
         {
            ErrorReportStorage.addDebugData("AvatarRenderManager","validateAvatarFigure: structure is null!");
         }
         var _loc6_:Array = _loc3_.getMandatorySetTypeIds(param2,2);
         if(_loc6_)
         {
            _loc7_ = _loc3_.figureData;
            if(!_loc7_)
            {
               ErrorReportStorage.addDebugData("AvatarRenderManager","validateAvatarFigure: figureData is null!");
            }
            for each(_loc8_ in _loc6_)
            {
               if(!param1.hasPartType(_loc8_))
               {
                  _loc9_ = _loc3_.getDefaultPartSet(_loc8_,param2);
                  if(_loc9_)
                  {
                     param1.updatePart(_loc8_,_loc9_.id,[0]);
                     _loc4_ = true;
                  }
               }
               else
               {
                  _loc10_ = _loc7_.getSetType(_loc8_);
                  if(!_loc10_)
                  {
                     ErrorReportStorage.addDebugData("AvatarRenderManager","validateAvatarFigure: setType is null!");
                  }
                  _loc11_ = _loc10_.getPartSet(param1.getPartSetId(_loc8_));
                  if(!_loc11_)
                  {
                     _loc12_ = _loc3_.getDefaultPartSet(_loc8_,param2);
                     if(_loc12_)
                     {
                        param1.updatePart(_loc8_,_loc12_.id,[0]);
                        _loc4_ = true;
                     }
                  }
               }
            }
         }
         return !_loc4_;
      }
      
      public function resetAssetManager() : void
      {
         this.var_317.reset();
      }
   }
}
