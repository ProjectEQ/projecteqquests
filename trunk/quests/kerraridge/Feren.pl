# Razortooth

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Rarr.  Me is Feren.  Me is fisher.  That means Feren catches [fish].");
	}
	
	if($text=~/what fish/i){
		quest::say("All kinds of fish.  Tasty fish.  All day Feren catches the fishes so all Kerran can eat.  I do for good of all Kerran.  Rrrrr.  One thing bother Feren always though.  Is bad fish.  [Razortooth].");
	}

	if($text=~/what razortooth/i){
		quest::say("Rrrrrr!  Razortooth mean fish.  Razortooth eat fish off Feren's line.  Razortooth gnaw Feren's boat.  Razortooth smart and dangerous.  Feren never able to catch Razortooth.  This haunt Feren for months.  If you was able to catch Razortooth. Feren be forever grateful. Maybe even give you possessions."); 
	}

}

sub EVENT_ITEM {

	if(($itemcount{6348} == 1)){ #Razor Tooth
		quest::say("Rarr, Feren not haunted by Razortooth no more. Feren grateful and give you this possession.");
		quest::summonitem(1062); #Kerran Fishingpole
		quest::faction(175,10); # Kerra Isle
		quest::givecash(0,0,0,2);

   }
   plugin::return_items(\%itemcount); #return items if not the ones required
}


#END of FILE Zone:kerraridge  ID:74088 -- Feren 

