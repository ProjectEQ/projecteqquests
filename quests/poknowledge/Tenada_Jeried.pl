#Tenada_Jeried.pl
#Three Manuals/Sage's Box of Research
#Giren found text for the Three Manuals quest, thanks. -Kilelen


sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("I am afraid I have little that I can talk about right now.  If you like you may speak to my [instructor] he can probably tell you about our work.");
	}
	if($text=~/who is your instructor/i){
		quest::say("My instructor is Sage Balic; you will be able to find him upstairs.  Ask him about his research. I'm sure he would love to tell you about his work.");
	}
	if($text=~/interested in learning/i){
		quest::emote("considers for a moment and continues, 'Very well, but first you must prove that you are a student of the advanced arts. In order to do this, you will need to collect each of the advanced manuals in combat, stealth, and magic. You will also need to seek out a prized possession known as a Hope Stone. I believe it currently lies somewhere in the elemental planes. Return to me with these four tools of learning, and only then will you be truly worthy of what secrets the planes have to offer.'");
	}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 16258 => 1, 28791 => 1, 	28797 => 1, 28794 => 1)) {#Hope Stone, Advanced Combat Manual, Advanced Magic Manual, Advanced Stealth Manual
    quest::emote("'s eyes go wide. 'This is incredible! You have proven yourself to be truly worthy of these planar secrets, $name. May its knowledge contained within guide you safely wherever you travel.'");
    quest::summonitem(28798);#Secrets of the Planes
  }
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
   return 1;
  }
}
#END of FILE Zone:poknowledge  ID:202046 -- Tenada_Jeried 

