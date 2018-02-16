sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Isn't Icewell the most beautiful Keep ye have ever seen stranger? I do hope you've taken the time to visit some of our other attractions in Thurgadin. I often go to remembrance park just to stare at the sculptures. Our people may be cold and simple, but keep in mind there is an artistic side to us as well."); }
}

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::moveto(67,703,39,270,1);
	}
	if($signal==2) {
		quest::moveto(10,535,68,0,1);
	}
}

#END of FILE Zone:thurgadinb  ID:129036 -- Councilor_Icelok 

