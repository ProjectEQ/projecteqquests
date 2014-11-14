sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Good day friend! I'm glad you've stopped by. I am in need of some assistance. Please direct anyone seeking work to me.");
  }
  if ($text=~/i seek work/i) {
    quest::say("Excellent! I practice the art of alchemy and I am currently working on some new recipes. I require a few special ingredients. Fortunately they grow in the crater just outside our city walls. Bring me a redcapped mushroom, a pinch of scarlet moss and a bluecapped mushroom. I'll be most grateful.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 3446 => 1, 3447 => 1, 3448 => 1)) {
    quest::say("Wonderful! I have little to offer you for your trouble aside from my gratitude. Here is a pinch of acrylia dust. I know it's not much. If you have no need for it go to Mignah, he can always use all kinds of acrylia.");
    quest::summonitem(3449);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:155080 -- Dronqam_Runghi