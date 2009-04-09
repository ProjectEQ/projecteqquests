#Agrakath_Theric.pl
#Willamina's Needles


sub EVENT_SAY {
	if($text=~/Hail/i) {
    quest::emote("regards you indifferently.  'You appear to be new around here, as I have not seen your face walking these streets before.  If you have come seeking knowledge, the library of Myrist will be a most excellent resource for you.  If you have come for any other reason, I'm afraid your quest will not go very far with me, as I do not have much time to hear of your escapades.  Good day.'");
  }
  if($text=~/erase the debt/i) {
    quest::emote("grins and says, 'So, that weasel Caden has sent you to settle his debt? And you actually agreed to this endeavor? Ha ha, very well! I shall transfer the responsibility of what Caden owes me to your shoulders. I have a simple job for you. Somewhere in the library there lies a book I have been searching for, but it has eluded me for quite some time. I believe it can be found somewhere in the upper levels. You are to venture into Myrist and seek out a tome titled History of Evils: The Age of Scale, and bring it to me. Do this one task for me and your debt shall be relinquished.'");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28188 => 1)) {#History of Evils: The Age of Scale
    quest::emote("eyes go wide with surprise as you hand over the book. 'Very impressive for one of your abilities. Here, take this note to Caden. He is absolved of his debt to me at this time.'");
    quest::summonitem(28084);#Note to Caden
    quest::exp(250);
  }
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
  }
    
#END of FILE Zone:poknowledge  ID:202057 -- Agrakath_Theric 

