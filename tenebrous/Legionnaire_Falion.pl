# items: 31756
sub EVENT_SAY{
	if($text=~/hail/i){
		quest::say("Greetings traveler! You look like you're still breathing and have your blood running through your veins so I suppose you may seek shelter behind the mighty walls of Katta Castellum.");
	}
}

sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 31756 => 1)){
		quest::say("A Vah Shir vampyre!! Isn't that disturbing! How are you supposed to spot its pale skin under all that fur! Come to think of it I've heard that a strange Vah Shir has occasionally been spotted heading towards the villages of the Coterie of the Eternal Night here in the Tenebrous Mountains. This may be the Vah Shir you are seeking. I will be sure to question any arriving travelers if they have spotted him.");
		quest::faction(1503,4); # Faction: Validus Custodus
		quest::faction(1502,1); # Faction: Katta Castellum Citizens
		quest::faction(1504,1); # Faction: Magus Conlegium
		quest::faction(1505,-1); # Faction: Nathyn Illuminious
		quest::faction(1506,-1); # Faction: Coterie of the Eternal Night
		quest::faction(1483,-1); # Faction: Seru
		quest::faction(1484,-2); # Faction: Hand of Seru
		quest::faction(1485,-1); # Faction: Eye of Seru
		quest::faction(1541,-1); # Faction: Hand Legionnaries
		quest::ding();
		quest::unique_spawn(172186,0,0,-1414,-1265,-38,0); # NPC: #Trigger_Kerzar_Clawtore
		quest::exp(1000000);
	}
	plugin::return_items(\%itemcount);
}
