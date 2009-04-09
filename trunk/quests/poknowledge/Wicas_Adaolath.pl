#Wicas_Adaolath.pl
#The Magic Pool

sub EVENT_SPAWN {
 quest::settimer(1,10);
}

sub EVENT_TIMER {
 if($timer eq "1") {
  $npc->SetAppearance(1);
  quest::stoptimer(1);
 }
}

sub EVENT_SIGNAL {
  if($signal == 1) {
    quest::say("Nothing at all. Do you think that he led us astray?");
  }
  if($signal == 2) {
    quest::say("I think we should just do what [Tarerd] wants us to do.");
  }
}

sub EVENT_SAY {
	if ($text=~/tarerd/i) {
		quest::say("Tarerd is the one who told us about these pools. He wanted us to kill some sort of lizards for him, but we have neither the time nor energy for such adventures. Perhaps you can get some information about the pools from him.");
	}
}
  
  
sub EVENT_ITEM { #Doesn't take any turn ins
	quest::say("I don't need this."); #text made up
	plugin::return_items(\%itemcount);
	return 1;  
}

#Done