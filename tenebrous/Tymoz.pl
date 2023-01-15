#Tymoz.pl
#Custodus Helms
# items: 31748, 31749, 31750


sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("So $race, you dare to stand before the mighty Tymoz?  I am the Governor of this village of the Coterie of the Eternal Night.  Do you wish to assist the Coterie, or will you better serve us as sustenance for our eternal lives?");
	}

	if($text=~/assist the Coterie/i){
		quest::say("You have made an intelligent decision my friend.  Our primary foe is the meddling Validus Custodus, the militia of Katta Castellum.  I will reward you for every two damaged custodus legionnaire helms or two damaged custodus centurion helms that you present to me as proof that you have slain members of our enemies ranks.");
	}
}

sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 31748 => 2)) || (plugin::check_handin(\%itemcount, 31749 => 2))){#Damaged Custodus Legionnaire Helm or Damaged Custodus Centurion Helm
		quest::say("Excellent! Two less of thos self righteous Validus Custodus goons to worry about!");
		quest::summonitem(31750);# Blood Dipped Dart
		quest::faction(1506, 5); #Coterie of Eternal Night
		quest::faction(1507, 5); #Valdanov Zevfeer
		quest::faction(1505, -10); #Nathyn Illuminious
		quest::faction(1503, 2); #Validus Custodus
	}
  plugin::return_items(\%itemcount);
}#Done
