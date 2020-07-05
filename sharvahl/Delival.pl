# items: 4478, 4460, 12000
sub EVENT_SPAWN {
	quest::say("Well thank heavens you're finally home, perhaps I should think twice before sending you out alone next time, little one.  Thank you so much for bringing her back, my friend.  Looks like she managed to talk you into carrying the buttons for her as well.");
	quest::settimer("depop",300);
}

sub EVENT_SIGNAL {
	if($signal==1) {
		quest::emote("sighs and says, 'My hands are full right now hon.'  Delival looks your way curiously and asks, 'I don't suppose you would want to [tuck] her in for me if I give you a blanket?'");
	}
	if($signal==2) {
		quest::say("Yes, yes, goodnight now sweetheart.");
		quest::depop();
	}
}

sub EVENT_SAY {
	if($text=~/tuck/i) {
		quest::say("Thank you again, have been a great help.  Here is her favorite blanket, just give it to her and she should be fine.  G'night Shainai.");
                quest::ding();
		quest::summonitem(4478); # Item: Shainai's Blanket
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 4460 => 1)) {
		quest::say("Well I wish there was more I could do to repay you. Take this old compass and what change I can spare with my most sincere thanks. Now off to bed Shainai, you have had a busy day.");
                quest::ding();
		quest::summonitem(12000); # Item: Compass
		quest::exp(100);
		quest::givecash(12,9,0,0);
		quest::faction(1513,5); #Guardian of Shar Vahl
		quest::signalwith(155339,1,10); # NPC: Shainai
	}
	plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
	if ($timer eq "depop") {
		quest::stoptimer("depop");
		quest::depop();
	}
}
