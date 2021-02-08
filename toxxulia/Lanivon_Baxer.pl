# Al'Kabor's Research - Ring of the Messenger
#
# items: 6069, 1573

sub EVENT_SAY { 
  if ($text=~/hail/i) {
    quest::say("Greetings, $name. Safe travels to you.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6069 => 1)) {
    quest::say("Excellent work! Thank you for delivering this to me. I will get it to the High Council as soon as possible. Take this Ring of the Messenger as an insignia of your service to the city.");
    quest::exp(85000);
    quest::summonitem(1573); # Item: Ring of the Messenger
  }
  plugin::return_items(\%itemcount);
}
# EOF zone: toxxulia ID: 414091 NPC: Lanivon_Baxer