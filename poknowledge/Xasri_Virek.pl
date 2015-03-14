#Xasri_Virek.pl
#Intermediate Combat Manual

sub EVENT_SAY { 
	#This text already existed in the file.  Not sure how it applies.  Leaving it here so it doesn't become lost.
	#if($text=~/Hail/i){
	#	quest::say("Hail. and welcome to the Kartis meeting hall.  I trust you are keeping busy here in New Tanaan?  It is truly a wonderful city. there are many interesting new things to discover here.  I came here from my home of Cabilis long ago. but I could not dream of returning now.  My life is here. wading in the font of knowledge that this place has to offer.  Hopefully I will be able to help you discover your own knowledge one day.");
	#}
	if($text=~/Hail/i){
		quest::say("I see by the beginner manual you carry that you are on the right track. Let us continue your lessons, shall we? Bring me the power source of the junk beast.  It resides in the Plane of Innovation.  Return this along with your Beginner Combat Manual.");#text made up/adapted from intermediate magic manual.
	}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28788 => 1, 29145 => 1)) {#Beginner Combat Manual, Junk Beast Power Source
    quest::say("Very impressive, $name. This proves you have clearly graduated to the next phase of training we have to offer. Keep this book by your side and speak to Gwiraba Gelrid when you are ready for your next lesson.");
    quest::summonitem(28790);#Intermediate Combat Manual
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:poknowledge  ID:202043 -- Xasri_Virek 

