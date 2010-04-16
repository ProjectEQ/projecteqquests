sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Pleasure to meet you, $name! How are you making out? My friend and I traveled from afar in search of adventure and we've certainly found it. This strange land has delivered excitement in spades. Hasn't it, Rorrst?");
  }
  if ($text=~/key/i) {
    quest::say("Are you trying to reason with Rorrst?");
    quest::emote("unsuccessfully attempts to stifle her tinny, high-pitch chortle.");
    quest::say("Now THAT'S a waste of time, and I would know. Personal experience. If you want something from him you'll have to try a different angle: Appeal to his coinpurse. Money talks. Tell him I said so.");
  }
}
sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}