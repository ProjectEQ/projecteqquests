#Dran_-Slug-_Rembor.pl
#Part of Innoruuk Regent

sub EVENT_SAY {
  if($text=~/ithvol/i && plugin::check_hasitem($client, 1370)) { #Disciple Symbol of Innoruuk
    quest::say("So you're the lucky errand boy, eh?! Let's hope you are more successful than the last chump who was sent. From what I hear, there was something pretty important in that last crate that was sent out. It just looked like a bunch of junk to me. Anyhow, we ran out of steel boning. Bring me two bonings so we can bind up the crate and be quick about it! Both of our necks are on the line!");
  }  
}

sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 12073 => 2)) {
    quest::say("Here's the crate of provisions. Take this to Dragoon Szorn in the Lesser Faydark immediately!");
    quest::summonitem(19030); #Crate of Teir`Dal Provisions
  }
  elsif(plugin::check_handin(\%itemcount, 12073 => 1)) {
    quest::say("Gee, thanks, but I can't do a whole lot without the rest! Get your act straight or we're both dead!");
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:neriaka  ID:40061 -- Dran_`Slug`_Rembor