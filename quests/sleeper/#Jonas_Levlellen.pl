#This NPC is just some flavor text for the zone, so far as I or Allakhazam can tell. Found the text, and wanted to add it.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Your abilities treat you well, as you have made it past some of the most difficult automatons that have been created to date. I made it here, such as you have, but my story is one lost ages ago in the myths and legends of the lands. If time did not stand still as a spirit, I might have forgotten it myself. Perhaps you would like to [hear it]?");
  }
 elsif($text=~/hear it/i){
  quest::say("As I thought, and a wise choice I might add. Never was there a more wise choice than listening to the ramblings of an age-old spirit, infused with the knowledge of a place that time has forgotten. I was a meager journeyman in my youth, traveling the lands to fulfill my own contempt of the life I had led. I met a multitude of men and women, all of whom had desires, riches, and most importantly -- things they needed done. And so it was that I took these tasks on, journeying from one place to another, doing their deeds and reaping the rewards. However, my follies came back to haunt me on what was to be my [last mission].");
  }
 elsif($text=~/last mission/i){
  quest::say("My journeys brought me to a seemingly old man who was in need of someone like myself to go on an expedition for him. He told me that there would be riches beyond my wildest dreams if I were able to complete this, and like a fool I was instantly enchanted. He told me of a place where the frost and rime had engulfed a cavernous lair. He spoke of mighty ice beings, great dragons, and an immortal beast only legend had known to be true. He only wanted me to retrieve for him [one thing].");
  }
 elsif($text=~/one thing/i){
  quest::say("He asked me to bring back proof that this place existed, proof that these ice beings and dragons were not just some myth, that they really did exist, and some kind of information or proof about this legendary creature. He told me that I could keep everything and anything else I found as my reward for doing this for him. And like a fool, I accepted the mission and ventured forth into the lands to find this tomb... My tomb. The search lasted for three years as I gained minute answers to questions on the whereabouts of a tomb larger than any constructed, one that was [home] to a mighty and powerful legendary creature. Eventually I found it, but it was more than I had expected.");
  }
 elsif($text=~/home/i){
  quest::say("When I found my way here I treaded lightly, unsure of what the ice beings looked like and unsure of whether they were more prominent than the dragons, or the other way around. Soon enough, I had my answer. Giant ice creatures, golems, gargoyles, beasts beyond comprehension all patrolled the halls with singular consciousness. I had found the tomb and all I needed from that point was proof. Well, proof and a good bit of treasure for my troubles. That was my last [mistake] though. As I trodded down the halls, I was aware that the frost-laden beasts were after me, in an attempt to remove me from this place. Booming voices engulfed the air around me as I ran, shouting that invaders would have their life forces extinguished and that I was not welcome here.");
  }
 elsif($text=~/mistake/i){
  quest::say("Despite where I ran, there were these beasts all around me and I couldn't find a way to leave. The exits were blocked, the tunnels twisted and turned into more and more of these frightful beasts. At last I came to a door and found that behind it was a man who had wandered the tomb for a great many years. He was a gnomish fellow who seemed to be down on his luck, but seemingly alive nonetheless. I spoke with him and explained my plight, but little did I know that he was not truly a man, but an undead spirit who sought to keep those like myself from ever venturing through this tomb. It was then and there that I was struck down... And that is all there is to my story. Pray that the same doesn't happen to you, for that man still occupies a part of the tomb, ever-awaiting the presence of a new intruder.");
  }
}

sub EVENT_ITEM {
 quest::say("I have no use for that, keep it."); #Made this up
 plugin::return_items(\%itemcount);
}

#Submitted by: Jim Mills