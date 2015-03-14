sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("looks like he's been sick for some time. He looks at you for a moment and motions for something to drink.");
  }
  if ($text=~/release/i) {
    quest::say("The ones that keep us here... the ones who defy the gods. They must be destroyed. I cannot recall a time outside of this place, but I believe the stories. I trust that we are from somewhere else. These creatures claim to be gods. They claim to have created us from the filth of the mines. This cannot be. I have seen the face of our true god. He told me of their blasphemy. He came to me and handed me the knowledge of how to reach their Emperor. He taught me to resist the prying magic of the fanatics. Are you the crusaders of prophecy... the ones who walk in the mist?");
  }
  if ($text=~/crusaders of prophecy/i) {
    quest::say("The prophecy will come to pass at last. Take my knowledge... the knowledge of our lord. I will not last much longer. This sickness will kill me like the others. There is one other who can help you. He claims to know some weakness of these creatures, seek him at the smelting furnaces near the mines. Now I must tell you the secret of the key.");
  }
  if ($text=~/secret of the key/i) {
    quest::say("There is a pouch to be found. It was specially made and requires three separate components to function. Seek out the Idol of Zazuzh and the Ring of Zeruzsh. These items are kept by the Emperor's must loyal Taskmasters. Place with them the Ssreashzian Insignia. This item will be much harder to acquire. I am sure you will be successful... our lord walks with you. Please be swift.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13006 => 1)) {
    quest::say("Are you here for them... are you here to release us?");
  }
  plugin::return_items(\%itemcount);
}