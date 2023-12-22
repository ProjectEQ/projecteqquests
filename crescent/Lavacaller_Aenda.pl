sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("From the earth, air, and water we summon creatures to protect us and from fire we call destruction! Few truly appreciate the complexities of a magician, but we of the Ring of the Elements truly appreciate these gifts.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}