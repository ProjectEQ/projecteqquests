sub EVENT_SAY {
	if (plugin::check_hasitem($client, 29165)){
		if ($text=~/Hail/i) {
			quest::say("Acquisition of power completed. Would you like to be transported to the time-projection chamber?");
		}
		if ($text=~/yes/i) {
			quest::say("Compliance.");
			quest::movepc(206,266,-857,-1853,62); # Zone: poinnovation
                }
	}
}