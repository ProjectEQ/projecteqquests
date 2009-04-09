#This NPC is just some flavor text for the zone, so far as I or Allakhazam can tell. Found the text, and wanted to add it.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("looks at you with a most dismal look in her eyes. 'Your kind have returned once again. I knew this day would come, yet hoped that perhaps there would be no further clashing in this tomb. I was mistaken, for here you are. The great sleeping beast has already been released unto the world to wreak havoc, cause destruction and attempt to take back what he has lost, so what further purpose could you have for coming here? Perhaps you are soul hunting, searching for those of us lost in here years ago, long since forgotten by any mortal family we may have had. Or perhaps you are searching for the [ancient dragons] that inhabit this lair.'");
  }
 elsif($text=~/ancient dragons/i){
  quest::say("The ancients were long ago part of the following that the mighty prismatic lord had before he was imprisoned here, in his own dwelling. Kildrukaun, oldest and wisest of them had at first spoken out against the creation of a prismatic dragon, claiming that Veeshan herself would have to approve of such a creation and that it would never take place. When it did take place however, and the dragon that never would exist was created, he traded his beliefs for those of new ones, claiming that this new prismatic dragon was part of a prophecy from Veeshan. He aptly called this prismatic dragon [Kerafyrm], or Prophetic Savior and began this new wonder's tutelage into greatness.");
  }
 elsif($text=~/Kerafyrm/i){
  quest::say("The majestic beast grew quickly, learning much and gaining great power in short time. He expanded his knowledge and his [influence], pushing the dragons into a kind of new era, where dragons would be the ultimate power on the planet once again. Many were left in a wake of fright behind Kerafyrm, believing that he may be too powerful for his own good, yet fearing that if they spoke out against him in this time, they would be condemned in some horrible way.");
  }
 elsif($text=~/influence/i){
  quest::say("Imagine a being with such power that he was unstoppable in battle. Imagine that this same creature held a loathing for all creatures not of dragon kin. Imagine also that this creature was not born into this deep rooted, dark hatred of the species, and that as he grew older, wiser and more powerful, he came to be aware of his powers and of the trying issues that kept his people back. This was the beast that was Kerafyrm, and as he grew in power, so too did his word. After some time, that which Kerafyrm spoke became law to the lands, and he usurped even the power and influence of the high council. What was once a time of might and strength through his word turned into a constant [chafe] against the necks of dragonkind.");
  }
 elsif($text=~/chafe/i){
  quest::say("I spoke of the loathing he held for those not of dragon kin. However, this is not entirely accurate. In the beginning, he simply sought to make dragonkind the most powerful of all species on Norrath. However there was a dark and definite itch within the brilliant mind of Kerafyrm and it spurned the hatred which was then released upon his kin and others alike. I believe it to be because he found himself to be above the mortal plane that he lived upon; he felt he was destined for greater things. Unfortunately, I'll never know for the great prismatic beast that was asleep has been released, and has journeyed to places far beyond this realm. There may be others in the tomb that know more, though that is a journey you must make alone, and I wish you luck, for you will surely need it.");
  }
}

sub EVENT_ITEM {
 quest::say("I have no use for that, keep it."); #Made this up
 plugin::return_items(\%itemcount);
}

#Submitted by: Jim Mills