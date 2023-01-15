#Cadelid_Etord.pl
#Intermediate Magic Manual
# items: 28795, 28801, 28796


sub EVENT_SAY { 
	#Text existing in the file already, preserving it.  I suspect some of these mobs tell you one thing 
	#when hailed if you have the right manual and another if you don't, but I don't know how to check what a pc
	#owns and does not own.
	#if($text=~/Hail/i){
	#	quest::say("Welcome.  You stand inside the meeting hall for the Selia district. a most beautiful section of New Tanaan if there ever was one.  Although I do miss the adventuresome streets of Shar Vahl. my home. it just can't compare to the serene beauty of this place.  Back home I was a teacher of the mystic arts. and ever since arriving to this land my knowledge has increased tenfold.  If you seek to gain a better understanding of the ways of magic. see me again sometime when you have elevated your ability to a higher degree.");
	#}
	if($text=~/Hail/i){
		quest::say("I see by the beginner manual you carry that you are on the right track. Let us continue your lessons, shall we? Magic can be a susceptible, yet volatile force sometimes, especially when wielded in the hands of dark beings. I fear there is one such being in particular that seeks to damage the very foundation of our mystic abilities, an ugly warrior by the name of Vhaksiz the Shade. He calls the Plane of Nightmares his home. You must seek this foul creature out and acquire proof of his demise: his dark, sinister heart. Bring it to me along with your Beginner's Magic Manual.");
	}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28795 => 1, 28801 => 1)) {#Beginner Magic Manual, Heart of Vhaksiz
    quest::say("Very impressive, $name. This proves you have clearly graduated to the next phase of training we have to offer. Keep this book by your side and speak to Zalil Nyvin when you are ready for your next lesson.");#Text borrowed from intermediate combat manual, instructor's name changed to match advanced magic manual.
    quest::summonitem(28796);#Intermediate Magic Manual
  }
   plugin::return_items(\%itemcount);
  }
#END of FILE Zone:poknowledge  ID:202038 -- Cadelid_Etord 

