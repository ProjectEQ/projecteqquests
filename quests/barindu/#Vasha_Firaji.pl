sub EVENT_SAY {
  if (($text=~/hail/i) && ($faction == 2)) {
    quest::emote("stares at you intently as though judging you on the spot. Making up her mind, she leans in close and says, I need your [help]");
  }
  if (($text=~/help/i) && ($faction == 2)) {
    quest::say("Shortly after the Muramites came and enslaved us, my family was picked as a target and slaughtered. The elders tell me to mourn and let it go but I cannot while my soul sears with hatred. I want [revenge]!");
  }
  if (($text=~/revenge/i) && ($faction == 2)) {
    quest::say("I wish death for every last one of these creatures, but I realize that simply isn't possible. The Aneuk Overseer is the one who ordered the deaths. Bring me his head so my heart can start to mend.");
  }
}
sub EVENT_ITEM {
  if ((plugin::check_handin(\%itemcount, 64011 =>1 )) && ($faction == 2)) {
    quest::emote("The look on Vasha Firaji's face softens and a tear rolls down her cheek.");
    quest::say("Thank you friend. With the beast where he belongs, I can finally begin to mourn. Please take this bracelet as a token of my thanks. It was my husband's. Proteri Amari tells me there is some magic locked away inside it.");
    quest::summonitem(64012);
    quest::faction(231,15);
  }
  plugin::return_items(\%itemcount);
}