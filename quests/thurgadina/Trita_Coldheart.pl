# frost bunny stew portion of 3rd coldain prayer shawl
#

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1416 => 1, 1426 => 1)) {
    quest::say("Why thank you, $name, I haven't tasted snow bunny stew this good in quite some time. Be a dear and take this back to Mordin for me.");
    quest::summonitem(1423);
    quest::exp(100000);
  }
  elsif (plugin::check_handin(\%itemcount, 1426 => 1)) {
    quest::say("Thanks for the Snow Bunny Stew, $name.");
    quest::exp(5000);
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::faction(49,10); #coldain
  quest::faction(67,10); #dain
  quest::faction(188,-30); #krif
  quest::faction(189,-30); #kzek
}


# EOF zone: thurgadina ID: 115075  NPC: Trita_Coldheart

