sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("It's that bastard Tormax whats the cause of all our trouble. What we need to do is send some specially trained assasins to take him out. Sure it's not the most honorable thing to do, but without him the giants wouldn't know what to do."); }
}

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::moveto(-4,887,-1,40.5,1);
	}
	if($signal==2) {
		quest::moveto(-5,543,66,0,1);
	}
}

#END of FILE Zone:thurgadinb  ID:129039 -- Councilor_Darkfrost 

