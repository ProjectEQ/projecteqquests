sub EVENT_ENTERZONE {
  $client->ClearCompassMark();
  my $instid = quest::GetInstanceID('mirb',50); #get the instance id
  # if the zone status is 5, set the lockout on the player.
  # this basically gets people who were dead at event completion, and rez/run in.
  if($qglobals{$instid.'_mirb_status'} >= 5) {
    quest::targlobal("mirb_50_lockout", 1, "D3", 0, $charid, 0);
  }
}