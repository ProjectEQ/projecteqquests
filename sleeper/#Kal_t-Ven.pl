#This NPC is just some flavor text for the zone, so far as I or Allakhazam can tell. Found the text, and wanted to add it.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("Greetings, young sleuth. These are trying times, as I am sure you are aware, but it is good that there are still adventurous sorts like you about. Were there not, I am confident that our deaths would have been in vain, and not in the spirit of exploration and danger-seeking. However, there is one thing to be said for [adventuring], and still another to be said for [flights of fancy]. Which is it for you?'");
  }
 elsif($text=~/flights of fancy/i){
  quest::say("While your choice, that attitude will get you nothing but a great deal of grief and an eventual death. I urge you to reconsider your decision to come into this vast lair without some kind of true commitment, as flights of fancy often end up poorly.");
  }
 elsif($text=~/adventuring/i){
  quest::say("Excellent, we can always use more of your type around, to perpetuate the life, if nothing else. Take care through this den though, as there are a great many things that would just as soon see you as a floor decoration than a wandering buccaneer, especially the four ancients at the end of it. From my own experience, I have found that the [larger golems] seem to be in charge and may instruct the others to do their bidding, which may or may not include the destruction of any invaders.");
  }
 elsif($text=~/larger golems/i){
  quest::say("I can assure you that if you proceed beyond these doors, you will find out for yourself. I will tell you though that there is a great master of the guardians that walk these halls, and he is aptly named as well, for he will instruct those below him to assist him should trouble engulf him. For your own sake, I hope you are prepared for the immensity of the situation ahead. If you are not, then this adventure is not for you, as it was not for me. What lay beyond was the death of me, not so long ago, and that is why I am now a permanent resident to these frosty walls. They do tell [stories] though. . .");
  }
 elsif($text=~/stories/i){
  quest::say("There is a story of a [short fellow] who came through here looking for grand adventures and seeking grand treasures, but all he found was grand pain and suffering. There is a lost love story of a [man and a woman] who came here in search of a friend, only to be sucked into the traps that litter the grounds beyond. Theirs is a most sad tale, wrought with pain and suffering, and whose story isn't yet completed. Then. . . then there is your story. Your story is what you make of it, and I hope for your sake you choose the pages of your adventure well. Look to the halls of this debilitating dungeon for answers you seek and perhaps you will find more than you were searching for.");
  }
 elsif($text=~/short fellow/i){
  quest::emote("closes his eyes, as if to re-imagine himself in a very intriguing and exciting chronicle. 'An overzealous little gnome, his life revolved around finding new and dangerous things. He would search for weeks on end looking for the next adventure, seeking out what a fabled beast looked like, or exploring to try and find the next great treasure. Milas was his name and his last great journey led him to the halls of this lair in search of [great knowledge], and great wealth.");
  }
 elsif($text=~/great knowledge/i){
  quest::say("No one knows for sure, except for Milas and the two lovers who came looking for him so long ago. As with most people though, I believe he came in search of the mighty sleeping beast with the hope that perhaps he might solve the mystery for himself and be the greatest gnome ever to have explored the extensive regions of this world.");
  }
 elsif($text=~/man and a woman/i){
  quest::say("Paldar and Ulessa Bladesoul were said to have been soul bound by love. They had found each other in life early on and made their lives together the happiest and most exciting they could. However, their excitement was lent in part by an overzealous gnome friend they had named Milas. He would bring them news of something new and exciting to look into, to explore, or to seek out. But when Milas decided that he was going to make a trip to this tomb, the two of them tried to dissuade him of the trek, for they thought it too dangerous. He made the trip anyway, and because he was their friend, they ventured to the tomb after him. This was to be their last mistake, and they paid their lives for it. You may still be able to see them wandering the halls, as their spirits have not left this tomb.");
  }
}

sub EVENT_ITEM {
 plugin::return_items(\%itemcount);
}

#Submitted by: Jim Mills