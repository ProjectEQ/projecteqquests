sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub EVENT_DEATH_COMPLETE {
  quest::unique_spawn(59159,83,0,-1150,1930,0); #a dark elf courier
}