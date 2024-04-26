# items: 20534, 20379
# quest: Bard Epic 1.0

sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::emote("smiles and taps her foot.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20534 => 1)) {
    quest::emote("hands you a small ring.");
    quest::summonitem(20379); # Item: Proof of Speed
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:lakerathe  ID:51052 -- Misty Tekcihta

