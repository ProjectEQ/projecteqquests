#########################################################
# Solvedi Aldeberan (ID:50333)
# Zone:   Rathe Mountains (rathemtn)
# Quest:  Solvedi Scimitar
# Author: a_sewer_rat
#########################################################

sub EVENT_SAY {

   if($text=~/Hail/i){
      quest::say("Hail, forestwalker. Welcome to the Rathe bear preserve of the Unkempt Druids. We strive to protect nature with diligence and punish her [defilers] with prejudice!");
   }
   if($text=~/defilers/i){
      quest::say("There are many defilers of nature about that warrant eradication. Groi Gutblade is a loathsome troll poacher who lurks in South Karana. Slay him and bring me his Lionhide Backpack. Timbur the Tiny takes pride in crushing the trees in North Karana into pulp under his feet. Make him pay for this affront and bring me his Laceless Sandal as proof of his demise. I will give you my own blade if you succeed.");
   }
}

#Handins
#      9352 : Giant Laceless Sandal (from 13th floor)
#     17350 : Lionhide Backpack (from 13th floor)
#Reward
#      5378 : Solvedi Scimitar

sub EVENT_ITEM {

   if(plugin::check_handin(\%itemcount,9352=>1,17350=>1)) {
     quest::say("You have done well. Here, take my blade as promised");
     quest::summonitem(5378);
     quest::exp(25000);
   } else {
     plugin::return_items(\%itemcount);
     quest::say("I have no need for these, have them back.");
   }
}

#END of FILE Zone:rathemtn  ID:50333 -- Solvedi Aldeberan
