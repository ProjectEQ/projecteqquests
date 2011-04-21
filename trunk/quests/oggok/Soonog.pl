sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("You [Greenblood]?");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18789 => 1)) {
    quest::say("Soonog own you now.. fight for Soonog.. Soonog make you power.. Soonog army rule all!");
    quest::summonitem(13527);
    quest::exp(100);
  }
  elsif (plugin::check_handin(\%itemcount, 13410 => 4)) {
    quest::say("You do good... take this... you fight again for Soonog!");
    quest::summonitem(5023);
    quest::exp(50);
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:oggok  ID:49035 -- Soonog