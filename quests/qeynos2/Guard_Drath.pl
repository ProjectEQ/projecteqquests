sub EVENT_COMBAT {
	if($combat_state == 1){
	my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail, $name.  If you are not busy, we can always use help keeping the beetle population under control in front of the gates.  But be careful, we have had sightings of a large queen beetle out there."); }
}
#END of FILE Zone:qeynos2  ID:2013 -- Guard_Drath 

