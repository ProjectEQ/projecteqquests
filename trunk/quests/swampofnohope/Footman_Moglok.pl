sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("looks at you with sorrowful eyes and wipes his dripping nose.");
    quest::say("Woe is me. I am nothing more than a lowly footman. And spare me the smart remarks - 'Moglok the Froglok' - I have heard all the jokes.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18234 =>1 )) {
    quest::emote("beams a big smile.");
    quest::say("Oh, joy! They have finally sent someone to help me on my mission! I was once a trooper, but I got demoted. I failed to bring Warlord Hikyg the three heads of the Gubbnubb triplets. Here is one head, but we need them all. Track the other two down and take all three heads and your soldier pike to Warlord Hikyg. I quit this outfit!!");
    quest::summonitem(12435);
  }
}