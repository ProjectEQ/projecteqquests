#Quest: Chialle's Friendship Ring

#NPC: Saren Kaja
#Zone: Shadeweaver's Thicket


sub EVENT_SAY {

  if($text=~/Hail/i){
  quest::say("Hello there friend, would you like to buy some of my delicious [Payala] goodies?");
  }

  if($text=~/Payala/i){
  quest::say("Payala has the sweetest nectar in all the lands. You can find them throughout the thicket beneath the blue leafed Payala tree. Try some. I have many Payala goodies for sale. I always say, 'the quickest way to someones heart is a freshly baked Payala tart!"); }
  }

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 30619 => 4)){
  quest::say("Oh thank you ever so much! You are truly as sweet as the gift you bring.");
  quest::summonitem(30625);
  quest::exp(2500);
  quest::faction(132,10);
  }

}


#Submitted by Deselminator

#END of FILE Zone:shadeweaver  ID:165172 -- Saren_Kaja 
