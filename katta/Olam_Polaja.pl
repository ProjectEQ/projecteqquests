sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Greetings stranger. A word of advice if I may. Don't get yourself suckered into a game of coppers with this woman. she has an iron gullet!"); 
	}
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::say("All right you begin, I am going to beat you this time!");
		quest::signalwith(160219,1,8000);
	}
	if($signal == 2) {
		quest::emote("attempts to flip a copper into a mug on the table and misses!");
		quest::signalwith(160219,2,8000);
	}
	if($signal == 3) {
		quest::emote("drinks a gulp of ale 'Nice toss!'");
		quest::signalwith(160219,3,1);
	}
	if($signal == 4) {
		quest::emote("attempts to flip a copper into a mug on the table and succeeds!");
		quest::signalwith(160219,4,8000);
	}
	if($signal == 5) {
		quest::signalwith(160219,5,8000);
	}
	if($signal == 6) {
		quest::emote("drinks a gulp of ale 'Nice toss!'");
		quest::signalwith(160219,6,1);
	}
	if($signal == 7) {
		quest::emote("attempts to flip a copper into a mug on the table and misses!");
		quest::signalwith(160219,7,36000);
	}
	if($signal == 8) {
		quest::emote("takes another gulp of ale and begins to look dizzy");
		quest::signalwith(160219,8,8000);
	}
	if($signal == 9) {
		quest::say("I'll...be...fine....uhn..");
		$npc->SetAppearance(3); 
		$npc->SetAppearance(0);
		quest::signal(160257,8000);
	}
}	


#END of FILE Zone:katta  ID:160223 -- Olam_Polaja 

