#Tymoz.pl
#Custodus Helms

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
		quest::faction(55, 5); #Coterie of Eternal Night
		quest::faction(349, 5); #Valdanov Zevfeer
		quest::faction(228, -10); #Nathyn Illuminious
		quest::faction(350, 2); #Validus Custodus
	}
  else {
    quest::say("I don't need this."); #text made up
    plugin::return_items(\%itemcount);
    return 1;
  }	
}#Done