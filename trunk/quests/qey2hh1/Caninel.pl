sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Leave me alone.");
  }
  if ($text=~/paw of opolla/i) {
    quest::say("What was that? The Paw of Opolla? Hmm... I might have heard of it.. But my information is valuable. I am a seeker of gems. I might offer up what I know if you were to give me three fine [jewels].");
  }
  if ($text=~/jewels/i) {
    quest::say("I require three jewels; a Bloodstone , a Moonstone , and a Star Rose Quartz. Only then will I tell you what I know of the rare and powerful Paw of Opolla.");
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10019 =>1, 10070 =>1, 10021 =>1 )) {
    quest::say("When the humans from Everfrost first met the Blackburrow Gnolls, the Shaman Opolla greeted them warmly but things went wrong and she had her hand cut off by Gynok Moltor. She placed a curse upon the Moltor descendants, the last of which can be found under Qeynos. Ask him about the paw and also about the rings on the paw.");
  }
 plugin::return_items(\%itemcount); 
}