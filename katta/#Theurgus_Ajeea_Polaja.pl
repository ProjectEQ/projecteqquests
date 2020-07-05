# items: 7779, 7361
sub EVENT_SPAWN {
	quest::settimer(1,900);
}

sub EVENT_TIMER {
	quest::depop();
}

sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 7779 => 1)){
		quest::say("Perfect. We shall begin the summoning and questioning. This enchanted scroll will magically scribe all that transpires within its radius of perception. Take it to Magistrate Phenic after the summoning and questioning are completed.");
		quest::faction(1504,5); # Faction: Magus Conlegium
		quest::faction(1502,1); # Faction: Katta Castellum Citizens
		quest::faction(1503,1); # Faction: Validus Custodus
		quest::faction(1483,-1); # Faction: Seru
		quest::faction(1484,-1); # Faction: Hand of Seru
		quest::faction(1485,-1); # Faction: Eye of Seru
		quest::faction(1541,-1); # Faction: Hand Legionnaries
		quest::summonitem(7361); #Enchanted Record of Events
		quest::spawn2(160458,0,0,-97,-822,11,0); #Autarkic Lord Sfarosh
		quest::signalwith(160458,1,1000); #Start conversation
	}
}

sub EVENT_SIGNAL{
	if($signal == 1){
		quest::say("How was it that you came to be imprisoned in the mansion of Nathyn Illuminious?");
		quest::signalwith(160458,4,5000); # NPC: Autarkic_Lord_Sfarosh
	}
	if($signal == 2){
		$npc->SetAppearance(3);
		quest::signalwith(160473,2,100); #Praecantor_Sels_Dawneyes
	}
	if($signal == 3){
		quest::signalwith(160472,3,100);  #Incantator_Jak_Masric
		quest::depop();
	}
}
