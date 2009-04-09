#Tenada_Jeried.pl
#Three Manuals/Sage's Box of Research
#No text exists for the "Three Manuals" quest that I can tell.
#From reading comments on Alla's, he doesn't mention it at all anymore, though
#apparently he still takes the hand in, so I guess it's no biggie that there's no
#text for it. -Kilelen


sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("I am afraid I have little that I can talk about right now.  If you like you may speak to my [instructor] he can probably tell you about our work.");
	}
	if($text=~/who is your instructor?/i){
		quest::say("My instructor is Sage Balic; you will be able to find him upstairs.  Ask him about his research. I'm sure he would love to tell you about his work.");
	}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 16258 => 1, 28791 => 1, 	28797 => 1, 28794 => 1)) {#Hope Stone, Advanced Combat Manual, Advanced Magic Manual, Advanced Stealth Manual
    quest::say("Take this $name, and may it serve you well.");#text made up
    quest::summonitem(28798);#Secrets of the Planes
  }
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
   return 1;
  }
}
#END of FILE Zone:poknowledge  ID:202046 -- Tenada_Jeried 

