sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("I'm sure if you've listened to my fellow councilors babble on for awhile you must surely think our nation is in chaos. Thats far from the truth however as we do not make the decisions for our people. It is the Dain's will alone that decides what course our people take, we simply offer our advice and opinions. Dain Frostreaver IV is a good and wise man, trust in him will take our people far I promise you."); }
}

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::moveto(-103,703,39,132,1);
	}
	if($signal==2) {
		quest::moveto(0,535,68,0,1);
	}
}

#END of FILE Zone:thurgadinb  ID:129038 -- Councilor_Dirkins 

