sub EVENT_SIGNAL {
  if($signal == 1) { 
  quest::spawn2(294608,0,0,$x,$y,$z,$h); # NPC: #Altar_Monument
  quest::depop();
  }
  }