sub EVENT_SAY { 
if ($text=~/hail/i) && ($class eq 'Rogue') {
  quest::say("Ah, welcome!  We could use some fresh blood around here. The name's Mater, and I run this little outfit.  Work hard for me, and I will reward you well. Cross me, and you'll find yourself buried under the mine cap. Once you are ready to begin your training please make sure that you see Crovsar Dirkbringer , he can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
}
elsif($text=~/Hail/i){
quest::say("Welcome to the mines of Kaladim!"); 
  }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:kaladimb  ID:67019 -- Mater 
