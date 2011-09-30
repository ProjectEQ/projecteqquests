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
quest::say("Hail. $name!  Good to see ya!  Welcome to Qeynos!  My name is Gehnus Torris.  If you are looking to do some trading. I would steer clear of that Tubal fellow.  He is from Highpass Hold and they are well known for taking advantage of travelers."); }
}
#END of FILE Zone:qeynos2  ID:2087 -- Guard_Gehnus 

