#This NPC is just some flavor text for the zone, so far as I or Allakhazam can tell. Found the text, and wanted to add it.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("Fare thee well, stouthearted adventurer. I would welcome you to this place, yet I feel that a welcome is not quite deserving of the [fate] in store for you. I know there was no welcome for me when I first ventured to this place, and look at me now. I am nothing but a frail, ghostly figure of what I once was.");
  }
 elsif($text=~/fate/i){
  quest::say("I may look as though I am healthy and vibrant, though your eyes deceive you.' Ferrin chuckles. 'It has been so long since I was imprisoned here, I cannot tell you when it was. To me it seems like only yesterday, but I know deep down that time does not pass for me any more. I, like you, thought that the intrigue and mystery of this great lair was second only to the treasures that lay within. When I arrived however, I found not a lair, but a massive tomb whose occupants were meant to keep a very large, and very powerful [beast] within.");
  }
 elsif($text=~/beast/i){
  quest::say("Time has told us that a great many things are unexplainable, and even less understood. Though I don't know the entire story, it comes to bear that long ago, there was a great council of [elders]. These elders decreed what could and could not be done, for the benefit of their kind. Certain things were done to prevent bad things. . . or bad creatures from being created. Other things were done to prohibit the slaying of those of the same bloodline.");
  }
 elsif($text=~/elders/i){
  quest::say("The council of elder dragons. Truly, theirs is a majestic, powerful and battle worn species. The elders had decreed that no two dragons of opposing elements would be allowed to mate. No explanation had been given, though I believe I know the reason why it was given. Despite the decree, a pair of elemental dragons slipped away to remote areas of Norrath and mated, and the creation of a great prismatic dragon took place. And that is the beast, strewn of opalescent scales, headstrong and a leader in his own right. It was he that this tomb was entrusted to keep held, forever. Alas, that was not meant to be, as more and more, cunning [travelers] like you would make their way further and further into the lair.");
  }
 elsif($text=~/travelers/i){
  quest::emote("chuckles. 'You're looking at one right now, $name. I was one of the first to make my way into the depths of this forsaken lair. My little gnomish friend here was also one of the earliest adventurers to peruse the contents of this massive warren. But there have been many more that have traversed these areas, all to little or no avail, most perishing at the hands of the mighty [automatons] throughout.'");
  }
 elsif($text=~/automatons/i){
  quest::say("Well, you probably encountered one or two of them before you found us here. They are the beasts that were initially created to keep people like us out so that the prismatic dragon wouldn't be awakened from his [eternal slumber]. In recent times, they have been placed here by the four ancients to keep people away from the evil that lay beyond. They are made of local velium and ice, carved from the creative minds of immortals. They have a singular consciousness, to do as their master bids. . . and to that truth, they hold steady.");
  }
 elsif($text=~/eternal slumber/i){
  quest::say("Alas I am not really the person to explain that bit of history to you. You might see if any of my. . . companions. . . have any insight into the slumber that the prismatic beast undertook. In any case, I bid you well, young mortal, and hope that you do not partake in the same shortcomings that I did.");
  }
}

sub EVENT_SIGNAL {
 if($signal == 0) {
  quest::say("Prismatic, you goof.");
  quest::signalwith(128036,0,0);
 }
}

sub EVENT_ITEM {
 quest::say("I have no use for that, keep it."); #Made this up
 plugin::return_items(\%itemcount);
}

#Submitted by: Jim Mills