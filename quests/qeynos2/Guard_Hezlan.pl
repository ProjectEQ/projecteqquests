sub EVENT_COMBAT {
	if($combat_state == 1){
	my $cur_target = $npc->GetHateTop();
		if($cur_target) {
		my $target_name = $cur_target->GetCleanName();
		quest::say("Time to die $target_name!");
		}
	}
}


sub EVENT_SIGNAL {
  quest::say("It isn't safe to be asking that kind of question. I just mind my business and do my job. You would, too, if you knew what was good for you.");
 }


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello. $name.  My name is Hezlan Nur and I am a member of the Qeynos Guard. serving the will of Antonius Bayle.  Anything or anyone trying to get into Qeynos has to go through me. first.  Heh!  I sure love it when those dirty Sabertooths try. though!  Nothing is as gratifying as the death wail of a gnoll."); }
}


#END of FILE Zone:qeynos2  ID:2088 -- Guard_Hezlan 

