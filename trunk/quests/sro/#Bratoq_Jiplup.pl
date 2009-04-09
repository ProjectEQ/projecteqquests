sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I'm going to hedge my bets and guess that you are here for my special vial? Takes me forever to make and is going to cost you 2000 platinum. Yes indeed.");
  }
}

sub EVENT_ITEM {
  if($platinum >= 2000) {
  quest::summonitem(57991);
  quest::say("As much as I do hate to part with these, I do hope you'll put it too good use and help the shaman of Norrath.");
}
plugin::return_items(\%itemcount);
}