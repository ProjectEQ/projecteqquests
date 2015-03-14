sub EVENT_SAY{
	if($text=~/hail/i){
		quest::say("Well met brave $race. I am Lathin Firetree, Governor of Wizardry here at the Magus Conlegium. I have an abundance of research and experimentation to attend to so unless you have an issue of importance to present or are going to assist me with the research I must get back to my studies.");
	}
}

sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 7270 => 1, 7169 => 1)){
		quest::say("Phenic wishes me to summon the Shade that is the owner of this belt for questioning. That is quite a dangerous request but it is not uncommon of Phenic to be a risk taker when it comes to his plots against the Coterie of the Eternal Night. Take this sketch and find a skilled potter to craft you a likeness of a shade from a large block of clay as a focus item for the ritual. When you have the unfired figurine fire it in a kiln with this special glaze on a High Quality Firing Sheet and return to me.");
		quest::faction(206,10);
		quest::faction(168,10);
		quest::faction(350,10);
		quest::faction(284,-30);
		quest::faction(139,-30);
		quest::faction(96,-30);
		quest::faction(138,-30);
		quest::ding();
		quest::exp(1000000);
		quest::summonitem(7271); #Shade Figurine Sketch
		quest::summonitem(7272); #Conlegium Enchanted Glaze
	}
	if(plugin::check_handin(\%itemcount, 7273 => 1)){
		quest::say("Excellent, this figurine will work wonderfully. A group of my best summoners is gathering on the first floor at the largest of the summoning circles to call forth the shade. Please take the figurine to Theurgus Ajeea Polaja immediately.");
		quest::faction(206,10);
		quest::faction(168,10);
		quest::faction(350,10);
		quest::faction(284,-30);
		quest::faction(139,-30);
		quest::faction(96,-30);
		quest::faction(138,-30);
		quest::summonitem(7779); #Second Shade Summoning Figurine
		quest::spawn2(160471,0,0,-75,-807,8,164); # #Theurgus_Ajeea_Polaja
		quest::spawn2(160473,0,0,-120,-808,8,88); # #Praecantor_Sels_Dawneyes
		quest::spawn2(160472,0,0,-97,-858,8,0); # #Incantator_Jak_Masric
		quest::signal(160249,1); # signal Theugus to depop
		quest::signal(160410,1);
		quest::signal(160252,1); #signal Incanter to depop
		quest::signal(160253,1); #signal Preecantor to depop
	}
	plugin::return_items(\%itemcount);
}