# items: 7270, 7169, 7271, 7272, 7273, 7779
sub EVENT_SAY{
	if($text=~/hail/i){
		quest::say("Well met brave $race. I am Lathin Firetree, Governor of Wizardry here at the Magus Conlegium. I have an abundance of research and experimentation to attend to so unless you have an issue of importance to present or are going to assist me with the research I must get back to my studies.");
	}
}

sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 7270 => 1, 7169 => 1)){
		quest::say("Phenic wishes me to summon the Shade that is the owner of this belt for questioning. That is quite a dangerous request but it is not uncommon of Phenic to be a risk taker when it comes to his plots against the Coterie of the Eternal Night. Take this sketch and find a skilled potter to craft you a likeness of a shade from a large block of clay as a focus item for the ritual. When you have the unfired figurine fire it in a kiln with this special glaze on a High Quality Firing Sheet and return to me.");
		quest::faction(1504,2); # Faction: Magus Conlegium
		quest::faction(1502,1); # Faction: Katta Castellum Citizens
		quest::faction(1503,1); # Faction: Validus Custodus
		quest::faction(1483,-1); # Faction: Seru
		quest::faction(1484,-1); # Faction: Hand of Seru
		quest::faction(1485,-1); # Faction: Eye of Seru
		quest::faction(1541,-1); # Faction: Hand Legionnaries
		quest::ding();
		quest::exp(1000000);
		quest::summonitem(7271); #Shade Figurine Sketch
		quest::summonitem(7272); #Conlegium Enchanted Glaze
	}
	if(plugin::check_handin(\%itemcount, 7273 => 1)){
		quest::say("Excellent, this figurine will work wonderfully. A group of my best summoners is gathering on the first floor at the largest of the summoning circles to call forth the shade. Please take the figurine to Theurgus Ajeea Polaja immediately.");
		quest::faction(1504,5); # Faction: Magus Conlegium
		quest::faction(1502,1); # Faction: Katta Castellum Citizens
		quest::faction(1503,1); # Faction: Validus Custodus
		quest::faction(1483,-1); # Faction: Seru
		quest::faction(1484,-1); # Faction: Hand of Seru
		quest::faction(1485,-1); # Faction: Eye of Seru
		quest::faction(1541,-1); # Faction: Hand Legionnaries
		quest::summonitem(7779); #Second Shade Summoning Figurine
		quest::spawn2(160471,0,0,-75,-807,8,328); # #Theurgus_Ajeea_Polaja
		quest::spawn2(160473,0,0,-120,-808,8,176); # #Praecantor_Sels_Dawneyes
		quest::spawn2(160472,0,0,-97,-858,8,0); # #Incantator_Jak_Masric
		quest::signal(160249,1); # signal Theugus to depop
		quest::signal(160410,1); # NPC: Theurgus_Ajeea_Polaja
		quest::signal(160252,1); #signal Incanter to depop
		quest::signal(160253,1); #signal Preecantor to depop
	}
	plugin::return_items(\%itemcount);
}
