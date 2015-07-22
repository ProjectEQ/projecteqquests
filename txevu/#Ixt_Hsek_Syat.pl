# #Ixt_Hsek_Syat (297211)
# 
# If the Raid wipes after Ixt Hsek Syat spawns
# - If Syat leaves combat and stays out of combat for 30min; depsawn
# - Respawn MC (and event) 30min after Syat despawn.

sub EVENT_SIGNAL {
	#Champion is at 15%, need to assist
	my $champion = $entity_list->GetNPCByNPCTypeID(297034);
	my $TopHate = $champion->GetHateTop();
	my $attack_name = $entity_list->GetClientByName($TopHate->GetName());
	quest::attack($attack_name->GetName());
}

sub EVENT_COMBAT {
  if ($combat_state==1){
    quest::stoptimer(1);
  } else {
    quest::settimer(1, 1800);
  }
}

sub EVENT_TIMER {
  if ($timer == 1) {
    quest::updatespawntimer(51505, 1800 * 1000); #Update MC Spawn Timer for 30min since there was a failure.
    quest::depopall(297209); #runt
    quest::depopall(297034); #MC
    quest::depopall(297211); #Hsek Syat
  }
}
