#Haggle Baron Dalnir is spawned from the Tormented Tradesman, and sticks around long enough to give us the final piece of the Greenmist puzzle that we need. After we get the design from him, we can forge the Greenmist Khukri in the Always Works forge in the same room.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("I have little time to speak. I can feel this facade weakening already. A Scaled Mystic came to me during my time of torment. He spoke to me. He said that a new time was hiding behind the darkness of the horizon. You seek Master Rile's Khukri. I can diagram it for you... Arrrgh! I feel the pull of torment upon me! Return to me with a piece of parchment, a quill, and Rile's Shattered Blade. Use your mirror again to bring me back and I will try to remember the design. Please be quick!");
  }
}

sub EVENT_ITEM {
  if(($itemcount{13051} == 1) && ($itemcount{13063} == 1) && ($itemcount{3888} == 1)){ #Crusaders of Greenmist (Greenmist Quest 8/8)
  quest::emote("stares at the broken blade for some time. After a few moments of studying, the apparition begins to draw and scribble on the parchment. He works with amazing speed as the memories from his past flood from his quill. The diagrams and runes that etch the surface of the parchment begin to glow. The legendary Haggle Baron rolls the parchment and hands it to you. Smiling, he bows deeply and quickly fades away.");
  quest::summonitem(3890);
  quest::ding();
  quest::depop();
 }
 else{ 
 plugin::return_items(\%itemcount);
 quest::emote("looks at the items you gave him, puzzles over them for a second, and hands them back to you. 'This is not what I requested of you.'"); #Made this up
 }
}

#Submitted by Jim Mills