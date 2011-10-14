sub EVENT_SPAWN {
	quest::SetRunning(1);
}

sub EVENT_SIGNAL {
	if($combat_state ==1){
		quest::say("On my way, Iceberg!!");
	}
}

sub EVENT_COMBAT {
	my $random = int(rand(5));
	if($combat_state == 1) {
		if($random ==1) {
			quest::say("Let me show you how the dwarves taught me to use my mining picks!!");
		}
	}
	if($combat_state == 0) {
		if($random ==1) {
			quest::say("Fer Halas!! One more victory fer the Wolves o' the North!!");
		}
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if(($wp eq 14) || ($wp eq 45)) {
		quest::say("Come on, Iceberg! Time to do a little mining.");
	}
	if(($wp eq 16) || ($wp eq 17) || ($wp eq 18) || ($wp eq 47) || ($wp eq 48)) {
		quest::say("Silver and Gold!!.. Silver and Gold!!");
	}
	if(($wp eq 19) || ($wp eq 49)){
		quest::say("Nothin'!!");
	}
}

sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings $race.");
}
if($text=~/sweaty shirt/i){
quest::say("I would give it to you, but I'm afraid Iceberg here is using it as a collar now. I think you might be able to distract him with some [Lion Roast] if you give it to him.");
}
if($text=~/lion roast/i){
quest::say("Yes, that is Iceberg's favorite snack. I think Teria O'Danos in Halas gets a shipment every month. You might want to talk to her."); }
}
#END of FILE Zone:everfrost  ID:30069 -- Tundra_Jack 

