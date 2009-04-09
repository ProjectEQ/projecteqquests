sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings to you. $name.  I have just returned from another trip to Katta Castellum and am trying to organize my notes. I apologize that I've little time to talk.  Everything happened so suddenly what with the odd circumstances surrounding the last diplomat. I have not quite had time to get used to my new post."); }

if ($text=~/who is behari/i) {
quest::emote("pauses to find the right words");
  quest::say("Behari, the last to hold this post, disappeared on his last trip to Katta. He was a friend of mine for some time, I never dreamed that I would have to undertake his duties in this way. I believe that I was the last to see him alive. His behavior at the time seemed peculiar, but I shrugged it off as simply a man blissfully in love,");
  quest::emote("he says with a heavy sigh, and adds somberly");
  quest::say("I was very happy for him");
}
if ($text=~/what behavior/i) {
  quest::say("I never mentioned this to Kalila, I thought it would hurt her more than it would help, but when I bumped into Behari just before he disappeared, he was going on and on about a love potion of some sort. He was very excited, said he thought it would be the perfect gift for Kalila on their wedding night, so you see why I never mentioned it. Anyway, he said that he had just gathered all of the ingredients and was heading back out of Katta.");
}
if ($text=~/what love potion/i) {
  quest::say("I have no idea what he meant by a 'love potion.' I have never even heard of such a thing, it just isn't my field, I am afraid. Maybe one of the spiritists knows something about it. I doubt that it will do anything to help you track down Behari, but I wish you luck my friend.");
}
}
#END of FILE Zone:sharvahl  ID:155088 -- Soroush_Koroun 

