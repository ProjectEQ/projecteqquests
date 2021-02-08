#Renaldok_Masric.pl
#Coterie Mask of the Dead
# items: 17096, 10799, 7778

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Greetings mortal. The aura of death that surrounds you is the only reason you are not already a feast for my minions. Have you come to me as a sacrifice or are you offering your [services] to the Coterie of the Eternal Night?");
	}

	if($text=~/services/i){
		quest::say("If you are powerful enough to be of use to me you will journey to the Twilight regions on the south side of Luclin and fill this wineskin with the blood of Akheva. Failure is final death, either at the hands of the Akheva or the hands of the Coterie.");
		quest::summonitem(17096);#Empty Blood Skin
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 10799 => 1)){#Skin of Akheva Blood
		quest::say("Well done, for a mortal you have served us well");
		quest::summonitem(7778);#Coterie Mask of the Dead
		quest::faction(1506, 5); #Coterie of Eternal Night
		quest::faction(1507, 5); #Valdanov Zevfeer
		quest::faction(1505, -10); #Nathyn Illuminious
		quest::faction(1503, 2); #Validus Custodus
	}
    plugin::return_items(\%itemcount);
}

sub EVENT_DEATH_COMPLETE {
	quest::signal(172168,1);  #signal for a chance to spawn Heratius Grolden
}
