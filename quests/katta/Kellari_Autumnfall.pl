sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Greetings friend. I am Kellari Autumnfall. Governess of Enchantment Studies. May I help you? If you are not here for a formal appointment. I'm afraid that I'm going to have to get back to work. I'm quite busy at the moment. so please excuse me."); 
	}
	if($text=~/sent me/i){
		quest::say("Governor Unja sent you?  That's a relief!  I am in dire need of an adventurer's services at this time.  The other governors have placed me in charge of deciphering the nature of the recent epidemic of undead attacks within our city's walls. I would assign some of the guards to handle this matter, but I feel that it may be best for someone who is not as well known to get more information on these attacks. Not that I do not trust our guards, mind you."); 
	}
	if($text=~/attack/i){
		quest::say("Most of the attacks have come from the area around the cemetery.  We have noticed that the undead there have all been covered in what appears to be the same set of arcane symbols.  I will need a complete set of those symbols to progress any further in my research.  Oddly enough, the last set that I had was removed from my quarters without my authorization.  Just make sure this set is completely legible.  The skin samples must not be damaged. Do you think you can handle this matter?"); 
	}
	if($text=~/colain/i){
		quest::say("She's been assisting with the burial ceremonies for quite some time, so she's had access to the bodies.  Bah!  She's shown promise as a cleric, but this has to be her doing. I've seen these glyphs in some of her books.  Please take the note that I just handed you to the courier that is waiting at the gate in Tenebrous.  I will alert the other governors and get the guards mobilized.  Colain Jasior should not make it out of the city, but the courier will ensure that she has no place to run to if she does."); 
	}
	if($text=~/matter/i){
		quest::say("Please, place the skin samples in the separate trays within this box and return it to me.  Maybe, I'll have an idea of what to do from there by the time you're done. Thank you for your assistance. Good hunting.");
                quest::ding();
		quest::summonitem('17103'); # 10 Tray Specimen Kit
	}
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 3870 => 1)){ #completed specimen kit
    quest::emote("looks at the various trays in the kit and turns pale, even for her normal complexion.  She looks at you and says, 'This is much worse than we thought.  We assumed that this was caused by someone from within our ranks, but I would never have thought that Colain was involved");
    quest::ding();
	quest::summonitem('3872');  # note from kellari
    quest::exp(1000);
	quest::givecash(7,12,13,5);
  }
   else {
    plugin::return_items(\%itemcount);
  }
}  
#END of FILE Zone:katta  ID:160190 -- Kellari_Autumnfall 

