#Durkis Battlemore.pl
#Gem Inlaid Gauntlets
#Despite my copious research, I could find no hail text for him. 

sub EVENT_SAY {
	if($text=~/Hail/i)   {
		quest::say("Hail, $name.");#Text made up
	}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 8910 => 1)) { #A Note to Battlemore
		quest::say("What have ye got there, lad? Ack. I thought I would never hear from that crazy old man again. He wants me to give you a pair o' me gauntlets. I suppose I kin do that. Here you are, $name . Wear them in good health.");
		quest::summonitem(8909);#Gem Inlaid Gauntlets 
		quest::exp(16000);
	}
	
	plugin::return_items(\%itemcount);

}

#End of File zone:butcher ID: 68113 -- Durkis Battlemore.pl