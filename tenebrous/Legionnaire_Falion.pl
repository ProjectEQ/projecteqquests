sub EVENT_SAY{
	if($text=~/hail/i){
		quest::say("Greetings traveler! You look like you're still breathing and have your blood running through your veins so I suppose you may seek shelter behind the mighty walls of Katta Castellum.");
	}
}

sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 31756 => 1)){
		quest::say("A Vah Shir vampyre!! Isn't that disturbing! How are you supposed to spot its pale skin under all that fur! Come to think of it I've heard that a strange Vah Shir has occasionally been spotted heading towards the villages of the Coterie of the Eternal Night here in the Tenebrous Mountains. This may be the Vah Shir you are seeking. I will be sure to question any arriving travelers if they have spotted him.");
		quest::faction(350,10);
		quest::faction(168,10);
		quest::faction(206,10);
		quest::faction(228,-30);
		quest::faction(55,-30);
		quest::faction(284,-30);
		quest::faction(139,-30);
		quest::faction(96,-30);
		quest::faction(138,-30);
		quest::ding();
		quest::unique_spawn(172186,0,0,-1414,-1265,-38,0);
		quest::exp(1000000);
	}
	plugin::return_items(\%itemcount);
}