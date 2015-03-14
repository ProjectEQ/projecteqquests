#Pazin_Punox.pl
#Rogue Tome Handin/Rogue Master Sketch

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Welcome to the Hall of the Ebon Mask. You had best be a rogue or you have no business here. We have nothing to say to outsiders.");
	}
	if ($text=~/dark assassin/i) {
		quest::say("Aye we were visited by that dark assassin, he left some sketch in my safekeeping, I would gladly give you a copy if you would take care of a problem that has been vexing me.");
	}
	if ($text=~/vexing you/i) {
		quest::say("An old student of mine who goes by the name Lon has disgraced this House; his betrayal to Innoruuk and Neriak is unforgivable.");
		quest::emote("grins 'He must be punished through deceit and trickery. Make him your friend, do as he asks, and pretend to be Redeemed as he calls it. Once you are Redeemed take the cursed blade of Ro and run it through his heart. Bring me his rapier and his head and I shall know the task is complete.'");
	}
}
sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 7041 => 1, 9438 => 1)){#Burning Rapier, Lon's Head
		quest::emote("laughs. 'Here, take this then!'");#text made up
		quest::summonitem(24095);#Vein Rot Sketch
	}
 	#do all other handins first with plugin, then let it do disciplines
  	#Preserved from original file
  	plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  	plugin::return_items(\%itemcount);
}#END of FILE Zone:neriakc  ID:42075 -- Pazin_Punox 
