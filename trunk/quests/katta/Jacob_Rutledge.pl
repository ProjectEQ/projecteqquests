sub EVENT_SAY { 
	if($text=~/Hail/i) {
		quest::say("Make your self welcome friend! We're all here for the same reason. To relax with congenial company and get a bit sloshed to forget about the vampyre villains and Inquisition spies lurking about! Haha! At any rate you're safe here with us friend!"); 
	}
}

sub EVENT_SIGNAL {
	quest::say("I hope you're planning on cleaning that spill up for us, Olam!");
	quest::signalwith(160219,9,9000);
}

#END of FILE Zone:katta  ID:160257 -- Jacob_Rutledge 

