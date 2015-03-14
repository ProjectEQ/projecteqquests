sub EVENT_SAY{
	if(($text=~/valdanov zefeer/i) && (defined $qglobals{first_badge_nathyn})){
		quest::say("Valdanov Zevfeer was a talented alchemist from Shadow Haven with whom I had many dealings. He would bring me components for my enchantment research from all the various environments here on Luclin. Since Valdanov had been such a valuable aid to me in the past I decided to return the favor and allowed him residence within my abode and helped to further fund his research as long as he assisted me in my own enchantment studies. He has since left to continue to pursue his own interests and I have not heard from him in [quite some time].");
	}
	if(($text=~/quite some time/i) && (defined $qglobals{first_badge_nathyn})){
		quest::say("Valdanov departed many years ago. He had become dangerously obsessive with his research of vampyre physiology and the effects of various alchemical formulae on the undead creatures. His obsession began when a traveler arrived in Katta Castellum speaking of a Vah Shir vampyre. Valdanov began leaving the safety of the city frequently in search of this undead Vah Shir and for questionable alchemical reagents with which he insisted on testing on [captured vampyres] being studied by the Magus Conlegium.");
	}
	if(($text=~/captured vampyres/i) && (defined $qglobals{first_badge_nathyn})){
		quest::say("After an unfortunate mishap with an escaped vampyre in the city the Magus Conlegium and the Validus Custodus declared that no vampyres shall ever again enter the city of Katta Castellum and only their ashes or blood may be studied under the careful observation of the Magus Conlegium. I am very sorry but I have some pressing business I must attend to and I'm afraid I have nothing more to offer. You may take this information back to Magistrate Phenic as he has requested.");
		quest::summonitem(31755); #Report of Nathyns Questioning
		quest::delglobal("first_badge_nathyn");
	}
}

sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 31752 => 1)){
		quest::say("Ahh i see you're assisting Phenic. Perhaps looking into more information on [Valdanov Zefeer]?");
		quest::setglobal("first_badge_nathyn", 1, 0, "F");
		quest::summonitem(31754); #Second Badge of Service
	}
  plugin::return_items(\%itemcount);
}