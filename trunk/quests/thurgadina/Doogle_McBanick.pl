sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Welcome ta me bar. I suggest ye sit down and have a drink cause if'n ye ai'nt drinkin ye've no business bein 'ere.");
  }
}

sub EVENT_ITEM {
  quest::say("I have no need for this, $name.");
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::say("Hello there Horasug! What brings ya here?");
		quest::signalwith(115013,3,8000);
	}
	if($signal==2) {
		quest::say("A vision you say? What exactly was this a vision of?");
		quest::signalwith(115013,4);
	}
	if($signal==3) {
		quest::signalwith(115013,5,7000);
	}
	if($signal==4) {
		quest::say("Well, you came to the right place, Horasug. A few of these ales will fill you with all the visions you can handle.");
	}
}

#END of FILE Zone:thurgadina  ID:Not_Found -- Doogle_McBanick