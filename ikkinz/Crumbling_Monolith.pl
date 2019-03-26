sub EVENT_SIGNAL {
  if($signal == 1) {
  quest::spawn2(294576,0,0,$x,$y,$z,$h); # NPC: #Crumbling_Monolith
  quest::depop_withtimer();
}
}