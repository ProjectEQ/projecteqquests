sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Greetings! You look like a healthy $race. We should play a game of coppers some time! You wouldn't be afraid to drink against a woman would ya?"); 
	}
}

sub EVENT_SPAWN {
	quest::settimer(1,60);
}

sub EVENT_TIMER {
	quest::say("You ready for some coppers Olam? I've got a fresh mug of Loyalist Ale waitin ta be drunk!");
	quest::signalwith(160223,1,8000);
	quest::stoptimer(1);
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::emote("attempts to flip a copper into a mug on the table and misses!");
		quest::signalwith(160223,2,8000);
	}
	if($signal == 2) {
		quest::emote("attempts to flip a copper into a mug on the table and succeeds!");
		quest::signalwith(160223,3,8000);
	}
	if($signal == 3) {
		quest::signalwith(160223,4,8000);
	}
	if($signal == 4) {
		quest::emote("drinks a gulp of ale");
		quest::signalwith(160223,5,1);
	}
	if($signal == 5) {
		quest::emote("attempts to flip a copper into a mug on the table and succeeds!");
		quest::signalwith(160223,6,8000);
	}
	if($signal == 6) {
		quest::signalwith(160223,7,8000);
	}
	if($signal == 7) {
		quest::emote("attempts to flip a copper into a mug on the table and succeeds!");
		quest::signalwith(160223,8,8000);
	}
	if($signal == 8) {
		quest::say("Are you feeling all right?");
		quest::signalwith(160223,9,8000);
	}
	if($signal == 9) {
		quest::say("You never can hold your liquor Olam!");
		quest::settimer(1,540);
	}
}

#END of FILE Zone:katta  ID:160219 -- Lyneea_Doyle 

