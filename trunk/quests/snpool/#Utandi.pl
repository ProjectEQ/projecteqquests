sub EVENT_SAY {
  if (defined $qglobals{sewers} && $qglobals{sewers} == 6) {
  if ($text=~/hail/i) {
    quest::say("I have a problem");
  }
}
  if (defined $qglobals{sewers} && $qglobals{sewers} == 6) {
    if ($text=~/what problem/i) {
  quest::say("I have lost my map.  It shows me how to get home. Can you help me find it?");
}
}
  if (defined $qglobals{sewers} && $qglobals{sewers} == 6) {
  if ($text=~/I will help you find it/i) {
    quest::say("Thanks!  Try to find a big pile of slime, I think he has my map.");
    quest::spawn2(285085,0,0,1354,471,-138,187);
  }
  }
  }
  sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 55617 =>1, 55618 =>1, 55619 =>1, 55620 =>1 )) {
  quest::setglobal("god_vxed_access", 1, 5, "F");
	$client->Message(4,"You receive a character flag!");
 }
  plugin::return_items(\%itemcount);  
  }