sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("To command a beast, you must first respect it. That is the nature of the Savageclaw Primalists. With that respect you can tap into the true feral nature of the beast and it becomes an even greater foe than it was before the beastlord's magic.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}