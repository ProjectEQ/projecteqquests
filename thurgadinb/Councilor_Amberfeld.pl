sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail there, $name. Amberfeld's the name and minin' is my trade. As the council representative of the Snowchippers, it be my duty ta make sure all these politicians and warmongers don't forget one thing. And that's that it's us miners that bring in the ore for weapons and the stones for their fancy houses."); }
}

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::moveto(108,665,38,63,1);
	}
	if($signal==2) {
		quest::moveto(25,542,65,0,1);
	}
}

#END of FILE Zone:thurgadinb  ID:129033 -- Councilor_Amberfeld 

