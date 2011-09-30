sub EVENT_SPAWN {
   my $ran = int(rand(750));
   quest::settimer(1,$ran);
} 
sub EVENT_TIMER { 
my $random = int(rand(2));	
	if($random == 0){
	quest::say("Nillipuss is my name. Stealing jumjum is my game. Think you can catch me? Let's see if you can! I'll always run faster than you ever ran."); 
	}
	if($random == 1){
	quest::say("Look what I've found! What a great find! It used to be yours, but now it is mine!"); 
	}
}


	