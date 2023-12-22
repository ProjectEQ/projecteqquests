sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("And on the greatest day I awoke and to my dragon mother I spoke! Dear Veshma, Osh`vir said, you knew this would happen -- you asked to become one of the drakkin!  No other could learn a song faster, and so I became the guildmaster!");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}