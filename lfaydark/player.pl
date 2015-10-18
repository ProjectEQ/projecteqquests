sub EVENT_CLICKDOOR {
  my $InInstance = 0;
  if ($doorid == 10) { #Asylum of Invoked Stone (mmcc) zone in
    $InInstance = quest::GetInstanceID("mmcc",50);
    if($InInstance > 0){
      quest::MovePCInstance(243,$InInstance,-467.37,-104.22,10.34);
    } else {
      $client->Message(13, "You are not a part of an instance!");
    }
  } elsif ($doorid==11) { #Scion Lair of Fury (mmcf) zone in
    $InInstance = quest::GetInstanceID("mmcf",50);
    if($InInstance > 0){
      quest::MovePCInstance(258,$InInstance,607,1503,33);
    } else {
      $client->Message(13, "You are not a part of an instance!");
    }
  }
}

sub EVENT_ENTERZONE { 
  my $InInstance = 0;
  $InInstance = quest::GetInstanceID("mmcc",50);
  if($InInstance > 0){
    $client->MarkCompassLoc(3880, -120, 116);
  }
}
