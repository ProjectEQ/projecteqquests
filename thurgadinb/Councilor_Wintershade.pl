sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Councilor Darakor here would have you believe we should march every man, woman, and child in the city to Kael tommorow. He is a fool and so are those who support him. I for one would like to see greater steps in ending this senseless conflict. Oh sure the giants are unreasonable right now, but reason can be bought in time."); }
}

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::moveto(6,895,-2,256,1);
	}
	if($signal==2) {
		quest::moveto(-10,534,67,0,1);
	}
}


#END of FILE Zone:thurgadinb  ID:129040 -- Councilor_Wintershade 

