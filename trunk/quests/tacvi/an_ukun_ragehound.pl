sub EVENT_SPAWN {
  if(!defined $qglobals{$instid.'_ragehound'}) {
     quest::targlobal($instid.'_ragehound',0,"H6",0,0,298); 
  }
}

sub EVENT_DEATH_COMPLETE {
  if($qglobals{$instid.'_ragehound'} == 0) {
     quest::spawn2(298041,0,0,$x,$y,$z,$h);
     quest::targlobal($instid.'_ragehound',1,"H6",0,0,298);
  }
  if($qglobals{$instid.'_ragehound'} == 1) {
     quest::spawn2(298041,0,0,$x,$y,$z,$h);
     quest::targlobal($instid.'_ragehound',2,"H6",0,0,298);
  }
  if($qglobals{$instid.'_ragehound'} == 2) {   
     quest::delglobal($instid.'_ragehound');
  }
}  