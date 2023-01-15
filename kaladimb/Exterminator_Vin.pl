# items: 13071
sub EVENT_SAY {
  if($text=~/hail/i){
    quest::say("Hello, I be Vin the Exterminator. I am here to get rid of these darn rodents that are plaguing our town. If ya would like to make a small bit of coin, perhaps you could help me. Hunt down some rodents and bring me four of their whiskers.  If yer not too busy, that is.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13071 => 4)){
    quest::say("Ah ya have returned. Nice work. You might consider a career in vermin extermination yourself!");
    quest::faction(312,5); # Faction: Storm Guard
    quest::faction(274,5); # Faction: Kazon Stormhammer
    quest::faction(293,5); # Faction: Miners Guild 249
    quest::faction(290,5); # Faction: Merchants of Kaladim
    quest::faction(232,-5); # Faction: Craknek Warriors
    quest::givecash(1,1,1,0);
  }
}
sub EVENT_COMBAT {
	if($combat_state == 1) {
	quest::say("Say yer prayers!!");
	}
}
sub EVENT_NPC_SLAY {
   	quest::say("Another unworthy opponent. Never cross Mining Guild 628!!");
 	}
	
#Submitted by Senzo : PEQ Quest Team
