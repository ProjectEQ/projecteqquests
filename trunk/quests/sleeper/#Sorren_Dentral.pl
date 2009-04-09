#This NPC is just some flavor text for before the Final Arbiter fight, so far as I or Allakhazam can tell. Found the text, and wanted to add it.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("You have made it quite far through the tunnels and hallways of this tomb, though I fear your journey is at an end now. I took your same journey through these cavernous halls many years ago, however like me you will not be able to best the challenge that awaits you beyond this tunnel's end. There is a great beast, a [last arbitration unit] set out upon this place to prevent any and all from reaching the Ancients beyond the gate. He is there and you will not be able to pass.");
  }
 elsif($text=~/last arbitration unit/i){
  quest::say("By those who have heard stories and legends, he is called the Final Arbiter. He is named this because he is the judge on who passes and who does not pass into the four Ancients' room beyond. Those who are not worthy and are not cleared to pass are killed. I was one such person, left behind to warn those of you who might do as you do right now. The Ancients are not friendly to those who are of your caliber, and so it is that you should not go further. They have placed this one here to prevent you from encountering them, they have done so for your own good, and for the good of those with you. Do not do as I did so long ago and make a [mistake] that will end your life.");
  }
 elsif($text=~/mistake/i){
  quest::say("Back in the days when the four warders were alive, and when the sleeper was still a mantle piece on the ground in the room beyond, I felt it was my duty as an adventurer and an entrepreneur to move forth and try and best the four warders. Little did I know that this beast was not a pleasant one, and who was indeed problematic at best. This one is very powerful, created initially by the great Yelinak himself. But after he was dismantled and reassembled for service to the Ancients, he became even more powerful, yet still served the singular purpose of keeping those of us out who might try to disturb the dragons beyond.");
  }
}

sub EVENT_ITEM {
 quest::say("I have no use for that, keep it."); #Made this up
 plugin::return_items(\%itemcount);
}

#Submitted by: Jim Mills