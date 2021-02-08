# items: 29899, 29898, 17516, 29692, 17517, 29694, 17518, 29695
sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Hello there weary adventurer. do you come seeking the truth?"); 
	}
	if($text=~/truth/i){
		quest::say("The truth is a precarious thing, twisted and torn by those that would deceive for their own nefarious purposes.  That is why there are people like me to guide the ignorant masses that know no better than to believe that which they are told."); 
		quest::signalwith(160111,1,2500); # NPC: Miller
	}
	if($text=~/phenic/i){
		quest::say("He that battles what he truly is only truly battles himself.  Phenic Dionicas for years has made quite a show of his war on the Vampyres of Tenebrous.  This misdirection of truth serves only to keep people from discovering that he himself is a foul demon of the night.  Miller and I, for our singular vision of that which is true, are not well liked in this city and so cannot obtain proof for your disbelieving eyes.");
	}		
	if($text=~/proof/i){
		quest::say("You wish to see the truth for yourself?  That is good, you will be taking your first step down a winding road to the only fulfillment this existence has to offer: enlightenment.  Take this flask of water, I have blessed it such that it will singe the skin of the unholy.  Go to Phenic Dionicas and give it to him, then you will see... you will see."); 
		quest::signalwith(160111,2,2500); # NPC: Miller
		quest::summonitem(29899); # Item: Arbogast's Holy Water
	}
	if($text=~/tsaph/i){
		quest::say("When you fake your death to discredit another you only discredit yourself when another sees your death was faked.  Yes, you heard me correctly, Tsaph Katta lives on here in this city, can you guess who it is he pretends to be?");
		quest::signalwith(160111,3,2500); # NPC: Miller
	}
	if($text=~/exist/i){
		quest::say("You are beginning to see the truest truths as the only true truths now, are you not? That large blue orb that hangs in the Luclin sky from time to time is nothing more than an overgrown comet. What appear to be land masses and other geological features are in actuality powerful illusions cast upon the comet by Tsaph Katta himself so that panic does not spread amongst the ignorant masses. I am not one to spread conjecture, but it is possible that Katta's astronomers have discovered that the comet is hurtling slowly toward Luclin and will destroy all life on the planet, so you can see why he would want to keep the truth about the [Exodus] from his journal."); 
	}
	if($text=~/exodus/i){
		quest::say("'The Exodus is the single biggest lie propagated onto the people of Katta Castellum in the known history of the intelligent races. Hogwash I tell you.");
		quest::signalwith(160111,5,2500); # NPC: Miller
	}
}

sub EVENT_SIGNAL {
	if($signal == 1) {
		quest::say("Yes, yes, I know you know... very good Miller");
		quest::signalwith(160111,4,5000); # NPC: Miller
	}
	if($signal == 2) {
		quest::say("A story told to children. Tsaph Katta wove together a tale of Seru trying to kill him on the fantasy world of 'Norrath' and how the entire combine fled here to escape from him... a wheel of lies, do you see how they interconnect? Why, I'll bet that even in Shadowhaven, the very site of this alleged 'Exodus' and home to one of the grandest libraries you will ever see, not a single shred of reliable evidence regarding such an event could be found. HA! You bring me a book on this 'Exodus' and Miller here will eat his hat! Especially if the book is wrapped in that gold paper I gave you...");
	}
	if($signal == 3) {
		quest::say("Oh, the foolish and naive, they are the salt of the land... anyhow, bring me two of these wrapped in the black paper you have and I shall reward you, my new ally of truth, with a cherished robe that was given us by Seru himself. Isn't that right Miller? Miller...");
	}
	if($signal == 4) {
		quest::say("Right then, let's get going Miller.");
		quest::signalwith(160111,7,5000); # NPC: Miller
		quest::start(23);
	}
	if($signal == 5) {
		quest::signalwith(160111,9,1); # NPC: Miller
		quest::spawn2(160377,25,0,$x,$y,$z,$h); # NPC: #Arbogast
		quest::depop_withtimer();
	}
}

sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 9) {
		quest::signalwith(160111,8,5000); # NPC: Miller
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 29898 => 1)){
		quest::say("He simply gave this to you?  Cunning indeed for him to cover his weakness so thoroughly- he must have powerful protective enchantments in place, no doubt put in place by his good friend and associate, Tsaph Katta!");
		quest::ding();
		quest::faction(1577,10); # Faction: The Truth
		quest::exp(1000000);
		quest::summonitem(17516); # Item: Silver Wrapping Paper
	}
	elsif(plugin::check_handin(\%itemcount, 29692 => 1)){
		quest::say("Ahh, you have retrieved the memoirs, let me see.' Arbogast opens the book and starts flipping through pages, 'Yes here, you... no, wait it must be back... hrmmm, maybe he... but it must... Well, that was pretty clever of old Tsaph Katta, removing any record of who he truly is- probably did it to cover up the fact that Norrath does not really exist.");
		quest::ding();
		quest::faction(1577,10); # Faction: The Truth
		quest::exp(1000000);
		quest::summonitem(17517); #gold wrapping paper
	}
	elsif(plugin::check_handin(\%itemcount, 29694 => 1)){ # gold wrapped book
		quest::say("Ahhh, excellent... I am glad to see your interest piqued. It is the truth that will liberate the masses when the masses fail to liberate the truth. To continue to divine and demystify the truth from the mistruth, I employ a powerful component known to the Akheva as 'Akuel xi ans Vius' which translated means 'Thing that tells Truth.");
		quest::signal(160226,5000); # NPC: Yavik_Teralin
		quest::ding();
		quest::faction(1577,10); # Faction: The Truth
		quest::exp(1000000);
		quest::summonitem(17518); #black wrapping paper
	}
	elsif(plugin::check_handin(\%itemcount, 29695 => 1)){ # black wrapped item
		quest::say("'Oh, would you look at that?");
		quest::signalwith(160111,6,5000); # NPC: Miller
		quest::ding();
		quest::faction(1577,10); # Faction: The Truth
		quest::exp(1000000);
	}
	plugin::return_items(\%itemcount);
}

