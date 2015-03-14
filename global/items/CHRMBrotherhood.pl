sub EVENT_SCALE_CALC {
  #Charm of the Brotherhood: improves when group members are same race or class
 
  my $playerrace = $client->GetRace();
  my $playerclass = $client->GetClass();
  my $group = $client->GetGroup();
  my $member;
  my $matchcount = 1;
  
  # cycle through all group members
  if($group) {
    for(my $i = 1; $i < 6; $i++) {
      $member = $group->GetMember($i);
      if($member) {
        # look for race/class that matches the player
        if(($member->GetClass() == $playerclass) || ($member->GetRace() == $playerrace)) {
	  $matchcount++;
	}
      }
    }
  }
  $questitem->SetScale($matchcount);
}