package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2649:int;
      
      private var var_1885:String;
      
      private var var_2614:String;
      
      private var var_2777:Boolean;
      
      private var var_2774:Boolean;
      
      private var var_2775:int;
      
      private var var_2615:String;
      
      private var var_2776:String;
      
      private var var_1825:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2649 = param1.readInteger();
         this.var_1885 = param1.readString();
         this.var_2614 = param1.readString();
         this.var_2777 = param1.readBoolean();
         this.var_2774 = param1.readBoolean();
         param1.readString();
         this.var_2775 = param1.readInteger();
         this.var_2615 = param1.readString();
         this.var_2776 = param1.readString();
         this.var_1825 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2649;
      }
      
      public function get avatarName() : String
      {
         return this.var_1885;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2614;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2777;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2774;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2775;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2615;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2776;
      }
      
      public function get realName() : String
      {
         return this.var_1825;
      }
   }
}
