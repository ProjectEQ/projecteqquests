#Leramas_Feston.pl
#Intermediate Stealth Manual


sub EVENT_SAY { 
	#Pre-existing text.  Preserving it, suspect mobs says one thing if you have the
	#correct manual and another if you don't.  Don't know a way to check what a pc owns,
	#can't find a function for it.
	#if($text=~/Hail/i){
	#	quest::say("Hello and welcome to New Tanaan.  You are currently standing inside the Tanaan meeting hall. please feel free to relax and let your mind rest for a time here.  Surely the adventures of planar travel must have you weary by now.  The exploration of knowledge is a noble cause indeed. I have dedicated my life to helping others with their studies.  Perhaps once you have achieved a certain level of readiness you should seek me out again.");
	#}
	if($text=~/Hail/i){
		quest::say("I see by the beginner manual you carry that you are on the right track. Let us continue your lessons, shall we? Bring me the Head of Rattican, who resides in the Plane of Disease.  Return this along with your Beginner Stealth Manual.");#text made up/adapted from intermediate magic manual.
	}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28792 => 1, 29133 => 1)) {#Beginner Stealth Manual, Rattican's Head
    quest::say("Very impressive, $name. This proves you have clearly graduated to the next phase of training we have to offer. Keep this book by your side and speak to Ethoach Trokith when you are ready for your next lesson.");#Text borrowed from intermediate combat manual, instructor's name changed to match advanced magic manual.
    quest::summonitem(28793);#Intermediate Stealth Manual
  }
  plugin::return_items(\%itemcount);
}#END of FILE Zone:poknowledge  ID:202048 -- Leramas_Feston 

