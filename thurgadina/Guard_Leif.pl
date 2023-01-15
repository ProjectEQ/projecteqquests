# tundrabear sandwich portion of 3rd coldain prayer shawl
#
# items: 1415, 1425, 1419

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1415 => 1, 1425 => 1)) {
    quest::say("Well I'll be derned. An outlander that can make a good Bearmeat 'n Bread! Thank ye, $name.");
    quest::summonitem(1419); # Item: Used Napkin
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
  quest::faction(406,10); #coldain
  quest::faction(405,10); #dain
  quest::faction(419,-30); #krif
  quest::faction(448,-30); #kzek
}


# EOF zone: thurgadina ID: 115198, 115030  NPC: Guard_Leif

