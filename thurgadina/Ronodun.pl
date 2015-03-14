sub EVENT_SPAWN {
	$npc->SetAppearance(1);
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp==1) {
		quest::emote("belches.");
		$npc->SetAppearance(1);
	}
	if($wp==23) {
		quest::say("Hullo, Petcas. Four dwarven ales please. Line 'em up for me, I need to knock 'em down quick.");
		quest::signalwith(115141,1,8000);
	}
	if($wp==45) {
		$npc->SetAppearance(1);
	}
}

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::say("Long story, Pet. I was studying with Grand Historian Thoridain's daughter last week. Outta nowhere she came and kissed me right on the mouth! Just then her father walked in and wouldn't listen when I tried to explain.");
		quest::signalwith(115141,2,8000);
	}
	if($signal==2) {
		quest::say("He went and told the Dain himself! I was summoned to the throne the next day where his highness sentenced me to a month of Thoridain's sermons. I just now managed to sneak away for a little refreshment.");
		quest::signalwith(115141,3,4000);
	}
	if($signal==3) {
		quest::emote("hiccups!");
		quest::signalwith(115141,4,3000);
	}
	if($signal==4) {
		quest::signalwith(115141,5,8000);
	}	
	if($signal==5) {
		quest::say("Thank ye, Pet. Yer most kind.");
		quest::signalwith(115141,6,7000);
	}
}	