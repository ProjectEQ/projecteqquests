sub EVENT_SPAWN {
	quest::settimer(1,3000);
}

sub EVENT_TIMER { 
	if ($timer == 1){
		my $random = int(rand(2));	
		if($random == 0){
			quest::emote("rubs her arms to warm herself up. 'Did you find me something other than biscuits yet? What? No? Stay on your side of the igloo, then, Sojan!"); 
		}
		if($random == 1){
			quest::emote("shivers violently.  'I hate this place.  My sister always told me I shouldn't be a pirate and that you were nothing but a clockwork grease pouring imbecile!");
		}
		quest::signal(110066,100); # NPC: Sojan_the_Sleepless
	}	
}

