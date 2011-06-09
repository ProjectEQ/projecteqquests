# The Fourteen Great Adventures
# Created by Gonner

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("focuses her attention on $name.");
    quest::say("Forgive me but sometimes I get so distracted when I stare out at the water here. I hate this feeling of worry that has overcome me. Here I am waiting for my son's return and yet something keeps telling me my wait is for naught. He is not coming back that is all I can think, but something keeps me hoping. I am sure you have heard our story, there are several others on this ship who have been awaiting the return of the 14 adventurers who set out to stop the Force Commander, one of them was my son Maddoc. While I am close to giving up, I would at least like to have something of his to remember him by. Something I can keep with me so I know somehow he is still looking out for me.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67619 => 1)) { # Maddoc's Writings
    quest::emote("takes the dusty tome from $name's hands.");
    quest::emote("takes the bound volume from your hands and weeps. As she flips from page to page the crying becomes more intense until finally she closes the book unable to continue. 'Something told me you would bring an end to my worry. While this is not the happy return I had wished for it will help me move on. May your adventures be plentiful and your spirit forever blessed. If you have already helped everyone, please tell De'van that your task is complete and he will reward you.");
    quest::setglobal("writingse", 1, 5, "F");
  }
  else {
    quest::say("I don't need this.");
    plugin::return_items(\%itemcount);
  }
}
# END of FILE Zone:abysmal  ID:279033 -- #Gizzmu_the_Wise.pl