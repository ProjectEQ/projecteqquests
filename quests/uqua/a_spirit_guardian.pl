my $rage_fury = 0;
my $instid = 0;

sub EVENT_SAY {
	$instid = quest::GetInstanceID('uqua',0);
	if (($text=~/hail/i) && ($rage_fury == 0)) {
		quest::say("The paths of fury and rage will unlock the way to the chambers of destruction. Behind each behemoth lies the hallways of fury and rage. I am one of few spirits whose souls have been cleansed of the corruption of Trushar. Now you must cleanse the taint of destruction from your spirit. In order to do this, you must tempt yourself with power. Only those who are worthy can walk the path of destruction. Defeating the harbingers of rage and fury is the only way to remove the taint that fills these halls. I would advise battling them simultaneously, as one will offer their power to the other shortly after being defeated. If you are successful, each altar will grant you its power and unlock the Chamber of Rites behind me. There you must give the power from each altar to its spectral keeper. If you are fast enough, you will remove the taint and gain access to the main ritual halls. That is where you will find Barxt and his followers. That is where your might will truly be tested. Tell me when you are [ready].");
	}
	if (($text=~/ready/i) && ($rage_fury == 0)) {
		quest::say("May your gods protect you. Let the trials begin.");
		quest::spawn2(292056,0,0,-822,-1249,8,188);
		quest::spawn2(292055,0,0,-917,-1251,8,61);
		quest::depop(292019);
		quest::depop(292020);
		quest::settimer("fail_timer",5400);
		$rage_fury = 1;
	}
}
sub EVENT_SIGNAL {
	$instid = $signal;
	$counter += 1;
    if($counter == 2) {
		quest::stoptimer("fail_timer");
		if (!defined($qglobals{$instid."_destper"})) {
			quest::setglobal($instid."_destoff",1,3,"H6");
			quest::ze(15,"The Altar of Fury and Altar of Rage hum in harmony. A bright flash of light illuminates the room momentarily, causing the tendrils of murky shadow to dissipate. The Aura of Destruction has faded away.");
		}
		quest::ze(15,"A strange voice shouts, You fools! While you may have stopped the rituals of fury and rage, you are still too late to prevent me from transferring the power of Trushar into our stone guardian. If you wish death, then continue into my chambers!");
		quest::settimer("orb_turnin",20);
	}
}
sub EVENT_TIMER {
	if($timer eq "fail_timer") {
		quest::stoptimer("fail_timer");
		quest::setglobal($instid."_destper", 1, 3, "H6");
		quest::ze(15,"Your time has elapsed, you must suffer the punishment of failure, there is nothing I can do to help now.");
	} elsif {$timer eq "orb_turnin") {
		quest::stoptimer("orb_turnin");
		quest::spawn2(292062,0,0,-869,-691,25,254);
		quest::spawn2(292063,0,0,-836,-692,25,255);
		quest::spawn2(292062,0,0,-906,-692,25,13);
		quest::spawn2(292063,0,0,-883,-636,26,133);
		quest::spawn2(292064,0,0,-850,-637,26,127);
		quest::spawn2(292065,5,0,-871,-209,59,125);
		quest::spawn2(292066,0,0,-871,-209,59,125);
		quest::spawn2(292067,0,0,-866,-43,61,130);
		quest::spawn2(292068,0,0,-869,-16,65,125);
	}
}
