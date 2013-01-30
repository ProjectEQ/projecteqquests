# Summoner of Bertox trigger mob

sub EVENT_SIGNAL {

if($signal == 1) {

	quest::settimer(20,7400);
	quest::settimer(21,300);

	}

if($signal == 8) {

	quest::depop_withtimer();
	
	}
}

sub EVENT_TIMER {

if($timer == 20) {

	quest::signal(200042);
	quest::signal(200043);
	quest::signal(200044);
	quest::signal(200045);
	quest::signal(200046);
	quest::signal(200047);
	quest::signal(200048);
	quest::signal(200049);
	quest::signal(200050);
	quest::signal(200051);
	quest::signal(200052);
	quest::signal(200053);
	quest::signal(200054);
	quest::signal(200055);
	quest::signal(200022);
	quest::signal(200056);

	}
if($timer == 21) {

	quest::spawn2(200044,0,0,0,280,-244,0);
        quest::stoptimer(21);
	}
}