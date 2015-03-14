sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Unless you intend to [make yourself useful], do not bother me.  I await the return of our Lord, Cazic-Thule.  He comes, and I shall be the first to greet Him.  I will train you, if need be, for He looks upon those who aid Him kindly.  If you are not here for training, return to your meditations or bother someone else.");
	}
	if($text=~/make myself useful/i){
		quest::say("One of our spies has reported a sighting of Malik Zaren, a courier of [the High Council].  He was seen resting at an inn called 'Golden Roosters' in High Pass Hold and is en route to Erudin Palace. He may be carrying a message containing information of great value to us.  Hunt him down and return to me with the letter he carries. I will reward you for this task.");
	}
	if($text=~/the high council/i){
		quest::say("The High Council is the governing board of Erudin, our sworn enemies.  Beware of these types, they will not look upon you warmly.");
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 12270 => 1)) { #sealed letter
		quest::say("Ah, excellent work.  I certainly had my doubts about you, $name.  Wear this well.");
		quest::ding();
		quest::summonitem(quest::ChooseRandom(3040,3042,3043,3044,3046,3047,3048,3049,3050,3051)); #random blackened iron
		quest::faction(143,5);  #Heretics
		quest::faction(79,-5);  #Deepwater Knights
		quest::faction(112,-5); #Gate Callers
		quest::faction(56,-5);  #Craftkeepers
		quest::faction(60,-5);  #Crimson Hands
                quest::exp(250);
	}
	#do all other handins first with plugin, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
	plugin::return_items(\%itemcount);
}
#END of FILE Zone:paineel  ID:75109 -- Shevra_Kollintar 
