#Phantasmist_Salkith.pl
#Planar Armor Exchange

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("tilts his head back, a sneer crossing his features in unmasked disgust toward $name. 'What exactly are you doing here, $name? Don't you know that this is the district of Kartis -- the center of the shaded voice of mortal power in the known universe? Perhaps you stumbled into the darkness by accident -- but then, why would not your deity of pure light, justice, valor, and honor deter you from this place? Perhaps they have abandoned you, or perhaps you have been subject to the true face value of their illusion.'");
		quest::emote("ponders a moment, then continues. 'Yes, $name, your god does not exist -- not as you think of them, for none of them care of you either way. Serve them with your life and go to the same place that all mortals go when they perish, despite their dogmatic affiliations. Indeed, I stand here on my own accord -- my faith is in myself and in my power and thus is how I fuel the shadow.  Perhaps this is a life more suited for you -- for it is a shame to see all that conviction and head-strong will go to waste, now isn't it?'");
	}
}
sub EVENT_ITEM {
	if((plugin::check_handin(\%itemcount, 1246 => 1)) ||
		(plugin::check_handin(\%itemcount, 1247 => 1)) ||
		(plugin::check_handin(\%itemcount, 1248 => 1)) ||
		(plugin::check_handin(\%itemcount, 1249 => 1)) ||
		(plugin::check_handin(\%itemcount, 1250 => 1)) ||
		(plugin::check_handin(\%itemcount, 1251 => 1)) ||
		(plugin::check_handin(\%itemcount, 1252 => 1))) {#Insidious Armor, the comments on Alla's about this not being taken are in error, I believe.  It's Fine Insidious that's not taken.
    	quest::say("Thank you, $name.");#Text made up
    	quest::summonitem(quest::ChooseRandom(10028, 10037, 22503, 15981));#Random gem: Peridot, Diamond, Blue Diamond, Raw Diamond
    	quest::exp(698775);
  }
  else {
   quest::say("I don't need this."); #text made up
   plugin::return_items(\%itemcount);
   return 1;
  }
}#END of FILE Zone:poknowledge  ID:202256 -- Phantasmist_Salkith 

