my $rage_fury = 0;

sub EVENT_SAY {
  if (($text=~/hail/i) && ($rage_fury == 0)) {
    quest::say("The paths of fury and rage will unlock the way to the chambers of destruction. Behind each behemoth lies the hallways of fury and rage. I am one of few spirits whose souls have been cleansed of the corruption of Trushar. Now you must cleanse the taint of destruction from your spirit. In order to do this, you must tempt yourself with power. Only those who are worthy can walk the path of destruction. Defeating the harbingers of rage and fury is the only way to remove the taint that fills these halls. I would advise battling them simultaneously, as one will offer their power to the other shortly after being defeated. If you are successful, each altar will grant you its power and unlock the Chamber of Rites behind me. There you must give the power from each altar to its spectral keeper. If you are fast enough, you will remove the taint and gain access to the main ritual halls. That is where you will find Barxt and his followers. That is where your might will truly be tested. Tell me when you are [ready].");
  }
  if (($text=~/ready/i) && ($rage_fury == 0)) {
    quest::say("May your gods protect you. Let the trials begin.");
    quest::spawn2(292056,0,0,-822,-1249,8,188);
    quest::spawn2(292055,0,0,-917,-1251,8,61);
    quest::depop(292019);
    quest::depop(292020);
    quest::settimer(1,5400);
    $rage_fury = 1;
  }
}
sub EVENT_SIGNAL {
  $counter += 1;
    if($counter == 2) {
	quest::stoptimer();
	}
}
sub EVENT_TIMER {
  $raid = $entity_list->GetRaidByClient($client);
      if ($raid) {
        for ($count = 0; $count < $raid->RaidCount(); $count++) {
          push (@player_list, $raid->GetMember($count)->GetName());
        }
     }
foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
     $charid = $pc->CharacterID();
     quest::targlobal("destper", 1, "H6", 292008, $charid, 292);
  }
  $client->Message(15,"Your time has elapsed, you must suffer the punishment of failure, there is nothing I can do to help now.");
  quest::depop();
}

sub EVENT_DEATH {
  $raid = $entity_list->GetRaidByClient($client);
      if ($raid) {
        for ($count = 0; $count < $raid->RaidCount(); $count++) {
          push (@player_list, $raid->GetMember($count)->GetName());
        }
     }
foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
     $charid = $pc->CharacterID();
     quest::targlobal("destper", 1, "H6", 292008, $charid, 292);
  }
  $client->Message(15,"There is nothing I can do to help now.");
}
