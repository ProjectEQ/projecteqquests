# Field Supplies
#
# items: 1724

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1724 => 1)) {
    quest::say("Ahh, thank you, $name. I've been waiting for these supplies for ages."); #generic reward text
    quest::faction(430,-30); #CoV
    quest::faction(419,10); #k-rif
    quest::faction(448,10); #k-zek
	quest::faction(429,10); #King_Tormax
    quest::givecash(5,5,2,1);
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: wakening ID: various mercenaries NPC: various mercenaries

