sub EVENT_TARGET_CHANGE {
  if (($client->GetTarget()->GetCleanName() eq "Lady Vox") && ($ulevel > 52) && ($status < 80)) {
    quest::ze(0,"I will not fight you, but I will banish you!");
    $client->MovePC(30,-7024,2020,-60.7,0); # Zone: everfrost
  }
}