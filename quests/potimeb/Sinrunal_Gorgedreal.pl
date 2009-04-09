sub EVENT_DEATH {
  quest::signalwith(223154,11040,0);
  quest::emote("topples, his shelled cranium splitting with a sickening crunch as it strikes the ground.");
}

sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
}
 }
