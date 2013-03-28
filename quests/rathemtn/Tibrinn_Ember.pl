#########################################################
# Tibrinn Ember (ID:50197)
# Zone:   Rathe Mountains (rathemtn)
# Quest:  Tibrinn's Quest
# Author: a_sewer_rat
#########################################################

sub EVENT_SAY {

   if($text=~/Hail/i){
      quest::say("I am Tibrinn Ember, forest friend and Unkempt Druid. Aid us in our [conflict] against the polluters of nature and I will reward you.");
   }
   if($text=~/conflict/i){
      quest::say("Grazhak the Berzerker is a powerful orc who roams these mountains. Slay him and bring me his Mithril Plated Girth. The gorge tyrant himself, King Xorbb, has plagued my halfling brothers for ages. Dispatch this beast and bring me his Slime Crystal Staff as proof of your deed. After you have brought me these items I will give you a weapon as reward for your feats.");
   }
}

#Handins
#      4310 : Mithril Plated Girth (from 13th floor)
#      6335 : Slime Crystal Staff (from 13th floor)
#Reward
#      6364 : Sap Sheen Staff

sub EVENT_ITEM {

   if(plugin::check_handin(\%itemcount,4310=>1,6335=>1)) {
     quest::say("You have done well. Here is the reward for your deeds.");
     quest::summonitem(6364);
     quest::exp(25000);
   }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:rathemtn  ID:50197 -- Tibrinn Ember 