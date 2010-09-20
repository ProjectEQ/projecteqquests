my $anpccounter;

sub EVENT_SPAWN {
    $anpccounter = 0;
    quest::spawn2(quest::ChooseRandom(223087,223226),0,0,67,1364,494.8,185.5); #An_Air_Phoenix_Noble
    quest::spawn2(quest::ChooseRandom(223087,223226),0,0,67,1347,494.8,185.5);
    quest::spawn2(quest::ChooseRandom(223087,223226),0,0,62,1364,494.8,185.5);
    quest::spawn2(quest::ChooseRandom(223087,223226),0,0,62,1347,494.8,185.5);
}  

sub EVENT_SIGNAL {
  if ($signal == 14058) {
    $anpccounter += 1;
  }
$check_mob = $entity_list->GetMobByNpcTypeID(223216); #Air will loop once if the zone is repopped after phase 1 has started. It shouldn't happen in normal play, but this hack prevents it.
  if ($check_mob && $anpccounter == 4) {
  }
  if (!$check_mob && $anpccounter == 4 ) {
    $anpccounter = 0;
    quest::spawn2(223120,0,0,68,1355,494.8,185.5); #Neimon_of_Air
    quest::spawn2(223995,0,0,68,1365,494.8,185.5);
    quest::spawn2(223995,0,0,68,1375,494.8,185.5);
    quest::spawn2(223995,0,0,68,1345,494.8,185.5);
    quest::spawn2(223995,0,0,68,1335,494.8,185.5);

}
  if ($signal == 14050) {
    quest::signalwith(223177,14060,0); #tell main about event success
    $anpccounter = 0;
    quest::depop();
}
 }
