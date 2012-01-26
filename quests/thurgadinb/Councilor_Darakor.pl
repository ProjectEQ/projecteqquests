sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hmmph, if you've come here to actually get something accomplished yer wastin yer time. This lot'll babble on endlessly about politics and luxuries. Only the Dain and a few others like myself want to deal with the actual problems of the Coldain, that being the bloody Kromrif of course."); }
}

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::moveto(-79,656,39,0,1);
	}
	if($signal==2) {
		quest::moveto(-15,544,66,0,1);
	}
}

#END of FILE Zone:thurgadinb  ID:129041 -- Councilor_Darakor 

