# Khati Sha Event
# Created by Gonner


sub EVENT_SPAWN {
	quest::settimer(1,1); 
	}


sub EVENT_AGGRO {
	quest::spawn2(154054,0,0,972.00,-556.00,-41.00,185); # Defiled Minion
	quest::spawn2(154054,0,0,970.00,-602.00,-41.00,225); # Defiled Minion
	quest::spawn2(154054,0,0,910.00,-602.00,-41.00,30); # Defiled Minion
	quest::spawn2(154054,0,0,905.00,-556.00,-41.00,60); # Defiled Minion
	quest::settimer(2,120);
}


sub EVENT_TIMER {
	my $x = $npc->GetX();
	my $y = $npc->GetY();

		if($timer == 2) {
			quest::spawn2(154054,0,0,972.00,-556.00,-41.00,185); # Defiled Minion
			quest::spawn2(154054,0,0,970.00,-602.00,-41.00,225); # Defiled Minion
			quest::spawn2(154054,0,0,910.00,-602.00,-41.00,30); # Defiled Minion
			quest::spawn2(154054,0,0,905.00,-556.00,-41.00,60); # Defiled Minion
		}	

		if($timer == 1 && ($y > -545)) {
			quest::shout("You will never remove me from my chamber!");
			quest::depop();
			quest::spawn2(154145,0,0,940.00,-610.00,-41.00,0); # Respawn Kahti Sha
			quest::signal(154054);
			quest::stoptimer(2);
		}			
		
		if($timer == 3) {
			quest::stoptimer(1);
			quest::stoptimer(2);
			quest::stoptimer(3);
			quest::depop();
		}
		
}


sub EVENT_SIGNAL {
	quest::emote("Who dares break the seals and defile the inner sanctum? Come forth so that I may crush you!");
	quest::me("With the seals broken the grimlings come to help solidify the door, to make sure no one enters.");
	quest::spawn2(154129,0,0,684.93,-380.15,-23.94,260); # 
	quest::spawn2(154129,0,0,684.93,-368.50,-23.94,260); # 
	quest::spawn2(154129,0,0,670.74,-358.34,-23.94,260); # 
	quest::spawn2(154129,0,0,670.74,-391.97,-23.94,260); #
	quest::settimer(3,7200); # 2 Hour kill timer
}


sub EVENT_DEATH_COMPLETE {
	quest::stoptimer(1);
	quest::stoptimer(2);
	quest::stoptimer(3);
}

#END of FILE zone:acrylia ID:154145 -- Khati_Sha_the_Twisted.pl

