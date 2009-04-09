###################################
# Chanda_Miller.pl
#
# Quests: Bear Hide armor
#
# Turn-in Items:
# Low Quality Bear Skin ID-13750 and 5 gold pieces
# Medium Quality Bear Skin ID-13751 and 15 gold pieces
# High Quality Bear Skin ID-13752 and 21 gold pieces
#
# Rewards:
# Bear-hide Belt ID-2904
# Bear-hide Boots ID-2903
# Bear-hide Cape ID-2902

sub EVENT_AGGRO {
   quest::say("Leave this land now!");
}

sub EVENT_SAY { 

   if ($faction <= 8) { # Need dubious or better (not sure this is correct).

      if($text=~/Hail/i){
         quest::say("Um.. I do not know you. Please um.. leave me be.");
      }

      if($text=~/baobob sent me/i){
         quest::say("Oh.. Hello. My name is Chanda. $name is your name? That's a nice name. My [brother] sent you to talk to me? You must want some bear.. um.. [clothes].");
      }

      if($text=~/what brother/i){
         quest::say("umm.. My brother.. Um.. I mean my BROTHER.. He is the finest tanner there is. His name is Baobob and I love him very much.");
      }

      if($text=~/what clothes/i){
         quest::say("I um.. know how to make.. umm.. [cloaks] and [boots]. Oh yes! and belts! I love to make bear skin belts! Um.. I really like [belts]. My [brother] says I have to start charging more gold 

for my stuff though..");
      }

      if($text=~/what cloak/i){
         quest::say("I.. um.. can make.. um.. a good cloak for you. You have to get me a bear skin of high quality and my brother says I should not make them unless you also give me 21 gold pieces. I used to 

give them away but [Baobob] got mad at me so I don't do that anymore.");
      }

      if($text=~/what boot/i){
         quest::say("I know how to make boots. Um.. I don't like them as much as belts. They are harder to make. You have to get me a medium quality bear skin and give me 15 gold pieces if you want some bear 

boots. They are really good, though. At least that is what Baobob tells me.");
      }

      if($text=~/what belt/i){
         quest::say("Oh, yes, I like making belts! They are easy! All I need is a bear skin and 5 gold pieces. The bear skin doesn't have to be that great but don't bring me a ruined one. The gold was my 

brother's idea.. sorry.");
      }

   } else {
      quest::say("I.. um.. I don't know you well enough to help you with th.. th.. that.. If you um.. do stuff.. for me and my brother or our family and friends in the Plains of Karana I might.. um.. 

reconsider.");
   }
}


sub EVENT_ITEM {

   if (plugin::check_handin(\%itemcount, 13750 => 1) && $gold == 5) {

      quest::say("Oh.. I see.. But um.. I still need the other thing before I can make anything for you.. sorry.");
      quest::say("Great. Oh, here, now I can make the.. um.. ok.. here. Yes.. good. I love making bear skin belts. Here you go. I hope you like it.");
      quest::summonitem(2904);
      $give_faction = 1;

   } elsif (plugin::check_handin(\%itemcount, 13751 => 1) && $gold == 15) { 

      quest::say("Oh.. I see.. But um.. I still need the other thing before I can make anything for you.. sorry.");
      quest::say("Ohh good.. good! I.. um.. can make.. Oh great. Here you go. I hope you like it. I always um.. try my best. Tell your um.. friends where you got your bear things!");
      quest::summonitem(2903);
      $give_faction = 1;

   } elsif (plugin::check_handin(\%itemcount, 13752 => 1) && $gold == 21) {

      quest::say("Oh.. I see.. But um.. I still need the other thing before I can make anything for you.. sorry.");
      quest::say("Oh, good! I can make you a nice new cloak now. Here. Here. Oh, this.. it is a good one. Nice bear fur. Here you go!");
      quest::summonitem(2902);
      $give_faction = 1;

   } else {
      plugin::return_items(\%itemcount);
   }

   if ($give_faction == 1) {
      quest::faction("167","1"); # +Karana Residents
      quest::faction("135","1"); # +Guards of Qeynos
      quest::faction("257","1"); # +Priests of Life
      quest::faction("183","1"); # +Knights of Thunder
   }

}

#END of FILE Zone:qeytoqrg -- Chanda_Miller