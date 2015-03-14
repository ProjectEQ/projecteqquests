sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Greetings stranger. It's nice to have visitors of the living sort. Seems like my work here is never done. When I'm not having to dig fresh graves and keep the mausoleum clean I'm having to refill old graves that have been dug up by the [restless dead] or them disrespectful [grave robbers]!");
	}
	if($text=~/restless dead/i){
		quest::say("That's right. We've got our fair share of undead lurking around our fine city. Most of the sorry souls aren't as troublesome as the vampyres and we've even got a few [friendly spirits] right here in this very mausoleum.");
	}
	if($text=~/friendly spirits/i){
		quest::say("Every so often when Norrath is near its zenith a group of spirits gathers at the podium and chairs over there. Seems they were some of the original Loyalists that arrived here on Luclin and helped build our great city of Katta Castellum. Their bodies are at rest in the stone crypts along these mausoleum walls and guarded by the [gargoyle warders]. Yet even in death their spirits convene to discuss the condition of Katta Castellum and the teachings of Tsaph Katta.");
	}
	if($text=~/gargoyle warders/i){
		quest::say("The gargoyles that guard the residents of this mausoleum are quite fascinating. They were carved late in the construction of Katta Castellum by a very talented dwarven stone worker. Gundle Chislebeard. Gundle used a type of stone found in the very cliffs Katta Castellum is built upon. At first the gargoyles were nothing more than impressive statues but then over time they began to [change].");
	}
	if($text=~/change/i){
		quest::say("I noticed the eyes of the gargoyles developed a slight glow to them. then they began to shift every so often. The movements were so slight that I probably would not have noticed had I not been working near them every day. Then one night a group of robbers entered the mausoleum and attempted to remove the lids of several crypts. The gargoyles came to life and chased the bandits away. The common presumption is that the spirits of fallen Validus Custodus Legionnaires inhabit the stone forms and continue the duties they performed in life.");
	}
	if($text=~/grave robbers/i){
		quest::say("It is unfortunate that there are so many disrespectful people that would rob the graves of the dead. The citizens of Katta Castellum do not commit such crimes against their ancestors but thieves from Shadow Haven. greedy Vampyres. and even members of the traitorous Inquisition seeking old combine relics have been caught digging up the dead. I have [lists of belongings] that have been stolen. it would please the spirits of Katta Castellum greatly if these items are returned.");
	}
	if($text=~/list of belongings/i){
		quest::say("Here are some lists of items that have been stolen from the crypts of the mausoleum in the past. You may bring each crypts set of four missing items to me separately. It is not necessary to find all three sets of items before returning but any set you do return must be complete to please the spirits. Perhaps you should ask around the shops in the other cities of Luclin if the merchants there have seen the missing items.");
		quest::summonitem(18353) #List of Stolen Items
	}
}

sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 10670 => 1, 10673 => 1, 10672 => 1, 10671 => 1)) {
		quest::say("I require the Aeridia Family Signet Ring, the Sealed Golden Scroll Tube, the Faded Silver Embroidered Robe, and the Tarnished Copper Runed Wand that were stolen from Holin Aeridias crypt.");
		quest::say("Give this box to the ghost of Holin Aeridia.");
		quest::ding();
		quest::summonitem(10682); # Holin Aeridia's Belongings
		quest::spawn2(160478,0,0,-1702,-633,11,2);
		quest::faction(168,10); #Katta Castellum Citizens
		quest::faction(350,10); #Validus Custodus
		quest::faction(206,10); #Magus Conlegium
		quest::faction(37,-10); #Citizens of Seru
		quest::faction(284,-10); #Seru 
		quest::faction(298,-10); #Shoulders of Seru
		quest::exp(1000);
	}
	elsif(plugin::check_handin(\%itemcount, 10674 => 1, 10675 => 1, 10676 => 1, 10677 => 1)) {
		quest::say("I require the Ancient Ornate Combine Dagger, Talikar Family Signet Ring, Faded Portrait of a Lady, and the Antique Platinum Medal that were stolen from Raien Talikars crypt.");
		quest::say("Give this crate to the ghost of Raien Talikar.");
		quest::ding();
		quest::summonitem(10683); # Raien Talikars Belongings
		quest::spawn2(160479,0,0,-1730,-568,11,100);
		quest::faction(168,10); #Katta Castellum Citizens
		quest::faction(350,10); #Validus Custodus
		quest::faction(206,10); #Magus Conlegium
		quest::faction(37,-10); #Citizens of Seru
		quest::faction(284,-10); #Seru 
		quest::faction(298,-10); #Shoulders of Seru
		quest::exp(1000);
	}
	elsif(plugin::check_handin(\%itemcount, 10678 => 1, 10679 => 1, 10680 => 1, 10681 => 1)) {
		quest::say("I require the Gold Embroidered Kilt, Silver Embroidered Tabard, Ancient Ceremonial Varhammer, and Old Sealed Medicine Pouch that were stolen from Shoeon Malicus' crypt.");
		quest::say("Give this crate to the ghost of Shoeon Malicus.");
		quest::ding();
		quest::summonitem(10684); # Shoeon Malicus' Belongings
		quest::spawn2(160480,0,0,-1667,-559,11,130);
		quest::faction(168,10); #Katta Castellum Citizens
		quest::faction(350,10); #Validus Custodus
		quest::faction(206,10); #Magus Conlegium
		quest::faction(37,-10); #Citizens of Seru
		quest::faction(284,-10); #Seru 
		quest::faction(298,-10); #Shoulders of Seru
		quest::exp(1000);
	}
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:katta  ID:160132 -- Yurddle_the_Caretaker 

