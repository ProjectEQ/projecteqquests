sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Please do not think poorly of me, but I must see your Journeyman's Cloak if you wish to converse. Be quick about it. This place is not completely safe.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6267 => 1) || plugin::check_handin(\%itemcount, 6159 => 1) || plugin::check_handin(\%itemcount, 6222 => 1) || plugin::check_handin(\%itemcount, 6184 => 1) || plugin::check_handin(\%itemcount, 6275 => 1)) {
    quest::say("Ah, there it is... I haven't seen one of those in a while. I remember when I first became a journeyman myself. That was many seasons and twice as many trails ago. Time becomes most deft in the period just after you figure that you've got a grasp on it.");
    quest::say("Well, let us get back to pebbles and tax, shall we? You displayed a great deal of bravery in coming out here and looking for me. I fear my age is beginning to show. I can't evade danger as I did in my youth. With that in mind, I would like you to take this journal back to town for me. Historian Sharar will tend to my notes for me. She is a trusted friend and a valuable scholar. Please give it to her with my thanks.");
    quest::summonitem(8466);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:hollowshade  ID:166000 -- Ahom_Guzhin