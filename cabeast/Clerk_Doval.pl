# items: 18240, 18250, 12460, 12461
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("takes a sip of lager and looks up at you. 'Ahh! An adventurer of sorts? Looking for work, are we? If you have the time, I might have a bit of a [proposition] for you.'");
  }
  if ($text=~/proposition/i) {
    quest::say("I was sent by the Legion to deliver a restraining order to a few of the troopers. They have been ordered to stay away from the tavern. They have spent too much time drinking and not enough training. I am to have them initial the restraint order list, but my feet are killing me. Perhaps you could [deliver the restraining order]?");
  }
  if ($text=~/restraining order/i) {
    quest::say("Here is the restraint order. Go to the troopers and ask them to [sign the restraining order]. Also, make sure to have them sign it in alphabetical order. I am a very big stickler about this. The troopers' names are as follows; Ozlot, Ogmire, Nish Nish, Frogzin, Gummin, Inkin, Roklon, Taer, Fryp and Selbat. When all is done, I shall pay you.");
    quest::summonitem(18240); #Legion Order (0 signed)
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18250 => 1)) { #Legion Order (all signed)
    quest::say("Thank you so much. I am so glad I did not have to deal with such a rowdy band of troopers as these. Please take some coin and perhaps a book from my personal library.");
    quest::summonitem(quest::ChooseRandom(12460, 12461)); #The Code of Combat, The Book of Knowledge - No IDs for The History of Combat or The Tome of Combat 
    quest::givecash(0,5,0,0);
    quest::faction(440,440); #Cabilis Residents
    quest::faction(441,30); #Legion of Cabilis
    quest::exp(1200);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:cabeast  ID:630 -- Clerk_Doval
