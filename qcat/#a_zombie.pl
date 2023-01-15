# items: 18804
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18804 => 1)) {
    quest::say("Rele.. ase.. me.. from.. this.. tor.. ment.. ARGH! You will die for entering the domain of the Bloodsabers!! Karana.. help.. me?");
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_DEATH_COMPLETE {
  quest::say("ARGH!!!!!.. Thank.. you..");
}
