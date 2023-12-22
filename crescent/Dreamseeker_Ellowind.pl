sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("My aptitudes have led me to become the guildmaster of the Dreamseekers, our enchanter guild. I wish I could recall who I was before I experienced my awakening as a drakkin. You would think as an enchanter, I would be able to tap into my memories, but the magic of The Six and their blood is so strong!");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}