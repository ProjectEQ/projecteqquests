sub EVENT_SPAWN {
	quest::settimer(1,900);
}

sub EVENT_TIMER {
	quest::depop();
}

sub EVENT_SIGNAL {
	if($signal == 1){
		quest::say("So it seems you are aware of the outcome of his hidden experimentation. Care to enlighten us as to what that outcome was?");
		quest::signalwith(160458,3,5000);
	}
	if($signal == 2){
		quest::say("Ajeea! What's happened?! I sense there are dark powers at work here!");
		quest::signalwith(160472,2,5000); #Incantator_Jak_Masric
	}
	if($signal == 3){
		quest::emote("rushes to Ajeea, lifts her comotose body with a magical force and they both vanish in a flash of light.");
		quest::signalwith(160471,3,100); #Theurgus_Ajeea_Polaja
		quest::depop();
	}
}