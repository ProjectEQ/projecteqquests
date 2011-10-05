sub EVENT_SPAWN {
  if(!defined $qglobals{$instid.'_lifebleeder'}) {
     quest::targlobal($instid.'_lifebleeder',0,"H6",0,0,298); 
  }
}

sub EVENT_DEATH {
  if($qglobals{$instid.'_lifebleeder'} == 0) {
     quest::spawn2(298043,0,0,$x,$y,$z,$h);
     quest::targlobal($instid.'_lifebleeder',1,"H6",0,0,298);
  }
  if($qglobals{$instid.'_lifebleeder'} == 1) {
     quest::spawn2(298043,0,0,$x,$y,$z,$h);
     quest::targlobal($instid.'_lifebleeder',2,"H6",0,0,298);
  }
  if($qglobals{$instid.'_lifebleeder'} == 2) {   
     quest::delglobal($instid.'_lifebleeder');
  }
}  