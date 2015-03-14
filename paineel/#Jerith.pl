#Jerith.pl
#Yiln's Missing Tomes

sub EVENT_SAY { 
	if($text=~/Osaftars/i){
		quest::say("Osaftars did you say? Jerith knows this name. Osaftars is a scourge of the seas. He takes what he wants and does what he wants. He is a captain of a ship. Yes, Jerith does believe the ship's name was the Stormwave. It can probably be found in the port town of [Dulak].");
	}
	
	if ($text=~/Dulak/i) {
		quest::say("Dulak is a pirate town on the island of Broken Skull Rock. A dangerous place. There is a ship that Jerith has taken to get there from the shores of the Stonebrunt Mountains.");
	}
}

sub EVENT_ITEM {
  	plugin::return_items(\%itemcount);

}#END of FILE Zone:paineel  ID:75013--#Jerith.pl