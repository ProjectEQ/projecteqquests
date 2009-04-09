# tundrabear sandwich portion of 3rd coldain prayer shawl
#

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1415 => 1, 1425 => 1)) {
    quest::say("Well I'll be derned. An outlander that can make a good Bearmeat 'n Bread! Thank ye, $name.");
    quest::summonitem(1419);
    quest::exp(50000);
  }
  elsif (plugin::check_handin(\%itemcount, 1425 => 1)) {
    quest::say("Well I'll be derned. An outlander that can make a good Bearmeat 'n Bread! Thank ye, $name.");
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


# EOF zone: thurgadina ID: 115198, 115030  NPC: Guard_Leif

