sub EVENT_SIGNAL {
	if($signal==1) {
		quest::say("Hey Fronden, I want a double of whatever you've been serving him!");
		quest::signalwith(115013,1,9000); # NPC: Horasug
	}
	if($signal==2) {
		quest::SetRunning(1);
		quest::start(7);
	}
	if($signal==3) {
		quest::say("Aye Sara, much better indeed. With the help of good Fronden here I think I've finally figured out what was causing the alarming condition under me left arm. I must admit it was givin me quite a scare for a while, not to mention the pain was drivin me to drink.");
		quest::signalwith(115010,4,8000); # NPC: Saramor
	}
	if($signal==4) {
		quest::say("Every day I come here to wet me whistle and I stand in the same spot, facin' the same way. As yer good wares take effect on me I lean more and more upon the bar here. The constant pressure was causin' me to develop... well... barsores. So I'll just have to face the other way from now on.");
		quest::signalwith(115014,2,8000); # NPC: Loremaster_Fronden
	}
	if($signal==5) {
		quest::signalwith(115014,3); # NPC: Loremaster_Fronden
	}
	if($signal==6) {
		quest::signalwith(115014,4,50000); # NPC: Loremaster_Fronden
	}
	if($signal==7) {
		quest::signalwith(115014,5,50000); # NPC: Loremaster_Fronden
	}
	if($signal==8) {
		quest::say("Say, Fronden, ya got anything stronger lyin' around back there?");
		quest::signalwith(115014,6,8000); # NPC: Loremaster_Fronden
	}
	if($signal==9) {
		quest::say("I'd be honored to try your family recipe. Thank ye.");
		quest::signalwith(115014,7,8000); # NPC: Loremaster_Fronden
	}
	if($signal==10) {
		quest::emote("looks at Fronden through crossed eyes and whispers hoarsely, 'Smooth'.");
	}	
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp==4) {
		quest::SetRunning(0);
	}
	if($wp==9) {
		quest::stop();
	}
}

