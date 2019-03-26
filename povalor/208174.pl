sub EVENT_SIGNAL {
  quest::spawn2(208175,0,0,$x,$y,$z,$h); # NPC: A_Mindless_Minion
  quest::depop_withtimer();
}