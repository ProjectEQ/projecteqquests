sub EVENT_SAY {
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/elder spirit sent me/i) {
  quest::say("Huh? Oh. Me see you help. Poor spirit. Me hope it okay. Only saw few days ago and it seem sad and sick. We make it better! Me hope yous okay wit' breathin' under here. Me be waiting for dat pesky fish to come back wit' my bark dat I got down here. You can help. In fact, you do it. He big nasty shark and me tired. If you wait, he come back for more. It probably still sniff me blood from dat last bite he took. You keep and take to spirit . . . Look out, dere it is and it got friends!");
}
}
}
sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}