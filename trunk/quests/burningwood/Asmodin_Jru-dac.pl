sub EVENT_SAY {
  if ($text=~/hail/i) {#need correct text
    quest::say("Hello traveler.  Now that I have been freed, I seek [revenge] on those who help me captive, but I am yet to weak to do it myself, so I will need your help.");
  }
  if ($text=~/revenge/i) {
    quest::say("Bring me a Fetish of Ice Mastery from the goblin ice masters in the Temple of Droga, as well as Cialin's Ice Staff.  I will reward you if you can help me.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 62098 => 3, 62099 =>1)) {
    quest::say("Thank you for helping me to gain my revenge.  May this help you on your way.");
    quest::summonitem(62205);
  }
}