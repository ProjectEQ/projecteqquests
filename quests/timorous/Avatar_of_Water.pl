# EPIC CLERIC (Timorous deep)

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,28023=>1)) { # Orb of the triumvirate
    #quest::say("[im not mute but really shy, what should i say ?]");
    quest::summonitem(5532); # Water Sprinkler of Nem Ankh 
    quest::depop();
    quest::exp(200000); 
    quest::ding();
  }
  plugin::return_items(\%itemcount); # return unused items
}


#End of File, Zone:timorous  NPC:96086 -- Avatar of Water