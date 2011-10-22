sub EVENT_SPAWN{
	quest::SetRunning(1);
}

sub EVENT_SIGNAL{
	if(($signal==1) && (($x == -495) || ($x == -734)) && (($y == -154) || ($y == 114))){
		quest::emote("Beep.. Beep.. Beep..");
		quest::pause(60);
	}
	if($signal==2){
		quest::start(178);
	}
	if($signal==3){
		quest::start(179);
	}
}
