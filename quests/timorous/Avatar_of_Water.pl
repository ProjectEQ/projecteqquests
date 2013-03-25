# EPIC CLERIC (Timorous deep)

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 28023 => 1)) { #Orb of the triumvirate
    quest::emote("takes the orb from you. The avatar has determined that you are worthy!");
    quest::summonitem(5532); # Water Sprinkler of Nem Ankh 
    quest::exp(200000); 
    quest::ding();
    quest::depop();
  }
  plugin::return_items(\%itemcount); # return unused items
}
#End of File, Zone:timorous  NPC:96086 -- Avatar of Water