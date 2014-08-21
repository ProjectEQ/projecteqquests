sub EVENT_SPAWN {
	quest::depopall(297063);
	quest::spawn2(297063,0,0,-1048,-966,-508,207);
	quest::spawn2(297063,0,0,-1046,-954,-509,175);
	quest::spawn2(297063,0,0,-1056,-954,-509,175);
	quest::spawn2(297063,0,0,-1073,-943,-509,105);
	quest::spawn2(297063,0,0,-1084,-958,-508,67);
}

sub EVENT_DEATH_COMPLETE {
	quest::spawn2(297214,72,0,$x,$y,$z,$h); #Shade
}