my @player_list = ();
my $event_started = 0;
my $counter = 0;

sub EVENT_SPAWN {
  quest::set_proximity($x-20,$x+20,$y-20,$y+20); 
}

sub EVENT_PROXIMITY_SAY {
  if (($text=~/i wish to enter/i) && $oncursor{67415}) { #Stone of Entry
    if (!$event_started && $entity_list->GetNPCByNPCTypeID(281118)) { #Pixtt_Tixxrt_Kvrok (NoTarget)
      $group = $entity_list->GetGroupByClient($client);
      if ($group) {
        for ($count = 0; $count < $group->GroupCount(); $count++) {
          push (@player_list, $group->GetMember($count)->GetName());
        }
        quest::movegrp(281,-1700,-1100,-4);
        quest::settimer(1,370); #Event timer of 6 minutes + 10 seconds prep time
        quest::settimer(2,10); #Start event in 10 seconds
        $event_started = 1;
      }
      else {
        $client->Message(15,"Maybe you should consider joining a group first.");
      }
    }
    else {
      $client->Message(15,"Mystical forces prevent you from entering at this time.");
    }
  }
}

sub EVENT_TIMER {
  if ($timer == 1) {   #group fail
    quest::stoptimer(1);
    quest::ze(15,"Understand that the punishment for spying is death! Kreshin Silentcog is now executed! All Hail Pixtt Xictic Krvne!");
    quest::depopall(281114); #a_chamber_guardian
    quest::depopall(281117); #Trixxrt`s_Guardsman
    quest::depopall(281123); #Pixtt_Tixxrt_Kvrok
    quest::depopall(281119); #Executioner_Hexxt_Xocik
    REMOVE_PLAYERS();
    $event_started = 0;
    $counter = 0;
  }
  if ($timer == 2) {  #starts event
    quest::stoptimer(2);
    quest::depopall(281115); #a_chamber_guardian (NoTarget)
    quest::spawn2(281114,0,0,-1675,-1151,-15,209); #a_chamber_guardian
    quest::spawn2(281114,0,0,-1666,-1140,-15,219); #a_chamber_guardian
    quest::spawn2(281114,0,0,-1691,-1169,-15,230); #a_chamber_guardian
  }
}

sub EVENT_SIGNAL {
  if ($signal == 1) { #Signal from a_chamber_guardian
    $counter += 1;
    if($counter == 3) {
      quest::depopall(281120); #a_chamber_guardian (NoTarget)
      quest::spawn2(281114,0,0,-1702,-993,-15,139); #a_chamber_guardian
      quest::spawn2(281114,0,0,-1686,-999,-15,143); #a_chamber_guardian
      quest::spawn2(281114,0,0,-1662,-1012,-15,164); #a_chamber_guardian
    }
    if ($counter == 6)  {
      quest::depopall(281121); #a_chamber_guardian (NoTarget)
      quest::spawn2(281114,0,0,-1778,-1167,-15,13); #a_chamber_guardian
      quest::spawn2(281114,0,0,-1804,-1155,-15,26); #a_chamber_guardian
      quest::spawn2(281114,0,0,-1829,-1102,-15,51); #a_chamber_guardian
    }
    if ($counter == 9)  {
      quest::depopall(281118); #Pixtt_Tixxrt_Kvrok (NoTarget)
      quest::depopall(281122); #Trixxrt`s_Guardsman (NoTarget)
      quest::spawn2(281123,0,0,-1741,-1078,-4.8,126.5); #Pixtt_Tixxrt_Kvrok
      quest::spawn2(281117,0,0,-1690,-1080,-14.4,193.3); #Trixxrt`s_Guardsman
      quest::spawn2(281117,0,0,-1788,-1079,-14.5,67); #Trixxrt`s_Guardsman
    }
  }
  if ($signal == 2) { #Signal from Executioner_Hexxt_Xocik
    quest::stoptimer(1);
  }
  if ($signal == 3) { #Signal from Kreshin_Silentcog on event success
    REMOVE_PLAYERS();
    $event_started = 0;
    $counter = 0;
  }
}

sub REMOVE_PLAYERS {
  foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
    $pc->MovePC(281,-1053,438,-16,1);
  }
  @player_list = ();
}