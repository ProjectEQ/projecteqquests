# NPC:
# Angelox
# Overseer Wrank event by cavedude

sub EVENT_ATTACK{
    quest::say("I will gladly choose death as my release");
}

sub EVENT_DEATH_COMPLETE {
  quest::emote("'s corpse falls back, its legs jerking spastically.");
 }

sub EVENT_ITEM {
 if (plugin::check_handin(\%itemcount, 2485 => 1)) {
      quest::signalwith(226200,23,0);
      quest::exp("100000");
      quest::depop_withtimer();
}
 elsif (plugin::check_handin(\%itemcount, 2485 => 2)) {
      quest::signalwith(226200,24,0);
      quest::exp("200000");
      quest::depop_withtimer();
}
 elsif (plugin::check_handin(\%itemcount, 2485 => 3)) {
      quest::signalwith(226200,25,0);
      quest::exp("300000");
      quest::depop_withtimer();
}
 elsif (plugin::check_handin(\%itemcount, 2485 => 4)) {
      quest::signalwith(226200,26,0);
      quest::exp("400000");
      quest::depop_withtimer();
}
plugin::return_items(\%itemcount);
 }
# EOF zone: Torgiran 