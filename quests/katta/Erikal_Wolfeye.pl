sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings $name. I am Erikal Wolfeye, Governor of exploration. Unfortunately, my duties to Katta Castellum tend to keep me from doing much of the actual exploring, but we have many fine men and women out in the field. That reminds me, I will have to check in with [Corporal Donfeld] and see how his new project is going.");
  }
  if($text=~/corporal donfeld/i) {
    quest::say("Corporal Donfeld has a very important job to do for me - reaching out and trying to make new allies is crucial to our future here on Luclin.");
  }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Ranger');
  plugin::return_items(\%itemcount);
}