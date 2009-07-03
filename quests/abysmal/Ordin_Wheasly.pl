sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello! Boy, I'm glad to see you! I really need your help. Can you help me with some simply [baking tasks]? A ship floats on its belly, you know.");
  }
  if ($text=~/assistance/i) {
    if (defined $qglobals{tylida} && $qglobals{tylida} == 4) {
    quest::say("You have been a big help around the kitchen! I wouldn't feel right continuing to abuse your kindness.' Ordin glances around. 'Take a quick peek into my recipe book. This is the way you grind the Taelosian Wheat into flour.' He quickly shows you the last page of his coveted recipe book. It only takes you a moment to see what the trick is. From now on, all you have to do is put the Taelosian Wheat or Taelosian Mountain Wheat into your mixing bowl and combine it to get the flour. In fact, you are certain that if you work at it long enough, you can produce more usable wheat with practice.");
  }
}
}


sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 58154 =>2 )) {
    quest::summonitem(58155);
  }
  plugin::return_items(\%itemcount);
}