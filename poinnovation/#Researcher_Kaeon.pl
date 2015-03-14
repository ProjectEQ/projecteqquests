sub EVENT_SPAWN {
  quest::spawn_condition($zonesn,1,0);
  quest::spawn_condition($zonesn,2,0);

}

sub EVENT_SAY {
  if ($text=~/hail/i && defined $qglobals{poiend}) {
    quest::say("Don't bother me, I'm conducting a test");
  }
  
 elsif ($text=~/hail/i) {
    quest::say("Salutations. We have been monitoring your performance in the scrap yards. Your ability seems to rival your physical capabilities. We would like to test your endurance and mental abilities further. Would you comply to endurance testing?");
  }
  if ($text=~/I will comply/i) {
    quest::say("'Excellent. We would like to test a maximum of six at one time. Are you ready to begin testing?");
  }
  if ($text=~/ready/i) {
    quest::say("Excellent I will now send you down to the testing bay. Assistant Kelrig will be there shortly with further instructions.");
    quest::depop(206081);
    quest::selfcast(1091);
    quest::spawn(206081,0,0,0,0,0);
    quest::setglobal("poiend",1,3,"H3");
  }
}
sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}