sub EVENT_COMBAT {
	if($combat_state==1) {
		quest::say("Guards!  Come smash!");
	}
}

sub EVENT_DEATH {
	quest::say("My comrades will avenge my death.");
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Gimme duffynitey rocks! Me crushem GUUD!!!");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 10073 => 1)) { #Dufrenite
    quest::emote("takes the dufrenite and crushes it with his bare hands.");
    quest::say("Here ya go!");
    quest::summonitem(19050); #Crushed Dufrenite
  }
  else {
    quest::say("What dis?");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:lakerathe  ID:51073 -- Grud