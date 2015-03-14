sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings friend, it is good to be freed from the clutches of those evil creatures. Tell me are you willing to help me bring some [justice] to them?");
  }
  if ($text=~/justice/i) {
    quest::say("For justice to be brought to them you will need to strike at some of the most powerful goblins found there. Seek out the goblin spirit callers deep within the Mines of Nurga and bring me back three Nurgan Spirit Fetishes. Also I will need the Huflam's Signet Ring. Do this and you will be well rewarded.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 62072 => 3, 62073 => 1)) {
    quest::say("Thank you for your assistance in bringing them to justice.  Please take this as a token of my thanks.");
    quest::summonitem(62192);
  }
  plugin::return_items(\%itemcount);
}