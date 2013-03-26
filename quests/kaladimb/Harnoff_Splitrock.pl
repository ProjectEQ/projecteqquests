#kaladimb\Harnoff_Splitrock.pl
#
#Quest: Restock High Quality Ore (North Kaladim)
#
#To Do:
#Allow NPC to "run out" of ore
#Restock NPC with ore

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetins to ya friend Dwarf! I've got some of the finest quality steel ores in all the lands! It's a bit troublesome ta keep a large enough supply of it though, it bein sought after by every smith ya know. If you're needin some cash or ore how bout you [run an errand] fer me?");
  }
  if($text=~/run an errand/i) {
    quest::say("I was hopin you'd be up fer the job! Take this here crate and fill it with either Small Bricks of Unrefined Ore or Large Bricks of Unrefined Ore and I'll pay ya when ye return.");
    quest::summonitem(17814); #Empty Ore Crate
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 10952 => 1)) { #Small Shipment of High Quality Ore
    quest::exp(2000);
    quest::givecash(0,0,0,8); #Platinum x 8
    quest::faction(169,5); #Kazon Stormhammer
    quest::faction(215,5); #Merchants of Kaladim
    quest::faction(220,-5); #Miners Guild 628
    quest::faction(219,5); #Miners Guild 249
    quest::faction(314,5); #Storm Guard
  }
  elsif(plugin::check_handin(\%itemcount, 10953 => 1)) { #Large Shipment of High Quality Ore
    quest::exp(3500);
    quest::givecash(0,0,0,14); #Platinum x 14
    quest::faction(169,5); #Kazon Stormhammer
    quest::faction(215,5); #Merchants of Kaladim
    quest::faction(220,-5); #Miners Guild 628
    quest::faction(219,5); #Miners Guild 249
    quest::faction(314,5); #Storm Guard
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:kaladimb  ID: -- Harnoff_Splitrock