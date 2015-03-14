sub EVENT_SPAWN {
   	quest::settimer(1,600);
}

sub EVENT_SPAWN {
	quest::shout("Well done everyone! You have completed the Haunted Hunt! Come to me for your reward!");
	quest::settimer(1,1800);
}

sub EVENT_TIMER {
	if ($timer == 1) {
		quest::stoptimer(1);
		quest::shout("Happy Halloween!");
		quest::depop();
	}
}

sub EVENT_SAY {
	if ($text=~/Hail/i && !defined $qglobals{halloween_candyman}) {
		$prize = int(rand(100));
		quest::say("Here you go $name. Enjoy!");
                quest::setglobal("halloween_candyman",1,0,"D30");
		quest::summonitem(87312,10);
		quest::summonitem(85062);
		quest::summonitem(85067,15);
		if($prize == 20){quest::summonitem(124688);}
	}
        if ($text=~/Hail/i && defined $qglobals{halloween_candyman}) {
                quest::say("Changing your costume isn't going to work! I already gave you your candy!");
	}
}