sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Me Uglan. Mighty ogre. Member of Crakneks. We crush for dark elves. Do you [like dark elves] or they be [mean] to you?");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13357 => 1)) {
    quest::say("You from Oggok. Me waiting for you. Me know dark elves have dark plan for ogres. We must stop plan. You must go to Nektulos Forest. Wait for blue orc. He deliver message for dark elf king. Not good. You kill blue orc runners. If message on them then you take to Lork in Oggok. Ogres must know plan.");
    quest::faction(239,10);
    quest::faction(303,10);
    quest::faction(278,-10);
    quest::faction(275,-10);
    quest::faction(245,-10);
    quest::faction(1522,-10);
    quest::exp(500);
  }
  plugin::return_items(\%itemcount);
}
