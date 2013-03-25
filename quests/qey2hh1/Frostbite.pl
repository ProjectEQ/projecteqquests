sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 12140 => 1)) {
		quest::summonitem(13383);
	}
	if(plugin::check_handin(\%itemcount, 12226 => 1)) {
		quest::emote("takes a whiff of the sweaty shirt and barks.");
		quest::settimer(1,15);
		quest::settimer(2,1200);
	}
	plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
	if($timer == 1) {
		quest::stoptimer(1);
		my $mobid = quest::ChooseRandom(12190,12190,12190,12190,12190,12191);
		my $x = quest::ChooseRandom(-3461,-3902,-4011);
		my $y = quest::ChooseRandom(-1457,-3240,-1362);
		quest::unique_spawn($mobid,188,0,$x,$y,10,0);
		quest::SetRunning(1);
        my $getmobbynpctype = $entity_list->GetMobByNpcTypeID($mobid);
		my $follow_target = $getmobbynpctype->GetID();
		quest::follow($follow_target);
	}
	if($timer == 2) {
		quest::depop_withtimer();
	}
}

sub EVENT_SIGNAL {
	quest::sfollow();
	quest::SetRunning(0);
	quest::moveto(-2236,-3532,34,110);
	quest::stoptimer(2);
}

