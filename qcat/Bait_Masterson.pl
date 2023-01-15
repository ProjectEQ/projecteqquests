#####################################
#Quests: Fisherman Convert
#NPC: Dleria Mausrel, Marlin Bizmite
#Zone: Qeynos
#Author: RealityIncarnate
#####################################
# items: 13922

sub EVENT_SAY { 
	if ($text=~/hail/i) {
		quest::say("You know.. I took up fishing because it was a nice, quiet activity. Most of all, I took it up to avoid conversing with strangers. Get the picture?!!"); 
	}
	elsif ($text=~/blessing of prexus/i) {
		quest::say("Prexus!!? Aye!! I once followed the ways of the Ocean Lord. I remember those days. So clear and peaceful were they. I shall make a deal with you, my friend. I shall give up fishing if you give me your guild tunic. With such a tunic I shall once again be compelled to follow the peaceful ways of the Ocean Lord.");
	}
}

sub EVENT_ITEM {
	#:: Match a 13544 - Old Blue Tunic*
  	if (plugin::takeItems(13544 => 1)) {
    		quest::say("Nice material!! I feel the ways of Prexus enlightening my soul. Unngh!! Enough of this fishing. Here take my broken fishing pole and toss it to the sea. All hail Prexus!!");
		#:: Give a 13922 - Snapped Pole
		quest::summonitem(13922); # Item: Snapped Pole
		#:: Ding!
		quest::ding();
		#:: Set factions
		quest::faction(242, 5);			#:: + Deepwater Knights
		quest::faction(266, 1);			#:: + High Council of Erudin
		quest::faction(265, -1);		#:: - Heretics
		#:: Grant a small amount of experience
		quest::exp(100);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
