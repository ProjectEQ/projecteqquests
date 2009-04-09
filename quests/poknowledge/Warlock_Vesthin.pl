#Warlock_Vesthin.pl
#Planar Armor Exchange

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::emote("peels back his thin, scaled lips, revealing a row of flawless tiny fangs in a grim gaze that brings even the bravest paladin to a moment of hesitation. 'We are somewhat. . . put off by your presence among us, though this is something I'm certain will not take long to remedy once you understand the peril you have come into. Strange, however, that you would wander into Kartis of either your own free will or the misdirection of your own footsteps. Perhaps you feel that you may learn from us what the other minions of the shadow have kept in their souls to use against us. I assure you, no such thing will come as you expect. Begone from this place, $name, for you will only burden or distract the best of us with the temptation to lure you into our folds. Aaaah, yes, that is the action of Kartis -- to bring our shadow into your soul, for we have emerged beyond the blade and drawing of blood in our convictions. By all means, continue in our midst and engage in that test if you believe yourself above it.'"); }
}
sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 1232 => 1)) ||
		(plugin::check_handin(\%itemcount, 1233 => 1)) ||
		(plugin::check_handin(\%itemcount, 1234 => 1)) ||
		(plugin::check_handin(\%itemcount, 1235 => 1)) ||
		(plugin::check_handin(\%itemcount, 1236 => 1)) ||
		(plugin::check_handin(\%itemcount, 1237 => 1)) ||
		(plugin::check_handin(\%itemcount, 1238 => 1))) {#Blighted Armor
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(3493875);
  }
  
		quest::say("I don't need this."); #text made up
		plugin::return_items(\%itemcount);
	
}#END of FILE Zone:poknowledge  ID:202255 -- Warlock_Vesthin 

