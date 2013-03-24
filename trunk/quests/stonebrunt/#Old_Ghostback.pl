#Old Ghostback

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 6981 => 1)) { #Kejekan Smithy Hammer
    quest::say("Freeing long imprisoned spirits is a noble cause. Your hammer has our blessing to free the souls from their crystalline shadow tombs.");
    quest::summonitem(6979); #Soulforge Hammer
    quest::exp(10000);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}