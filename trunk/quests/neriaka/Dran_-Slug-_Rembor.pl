#Dran_-Slug-_Rembor.pl
#Part of Innoruuk Regent

sub EVENT_SAY{
	if($text=~/Ithvol sent me/i) {
    quest::say("Did he?  Good, bring me two steel bonings to complete this crate of provisions and be swift!");#text made up
  }  
}

#This text was pre-existing.  I changed this to use the plugin.  It was slightly broken, he would bitch you out for bringing enough bonings.
sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 12073 => 2)) {
    quest::say("Here's the crate of provisions. Take this to Dragoon Szorn in the Lesser Faydark immediately!");
    quest::summonitem(19030); #Crate of Teir`Dal Provisions
  }
	elsif(plugin::check_handin(\%itemcount, 12073 < 2)){
		quest::say("Gee, thanks, but I can't do a whole lot without the rest!  Get your act straight or we're both dead!");
	}
  else {
    quest::say("I don't need this."); #text made up
    plugin::return_items(\%itemcount);
    return 1;
  }
}#END of FILE Zone:neriaka  ID:40061 -- Dran_`Slug`_Rembor 

