sub EVENT_SPAWN {
  if(!defined $qglobals{$instid.'_manasipper'}) {
     quest::targlobal($instid.'_manasipper',0,"H6",0,0,298); 
  }
}

sub EVENT_DEATH {
  if($qglobals{$instid.'_manasipper'} == 0) {
     quest::spawn2(298042,0,0,$x,$y,$z,$h);
     quest::targlobal($instid.'_manasipper',1,"H6",0,0,298);
  }
  if($qglobals{$instid.'_manasipper'} == 1) {
     quest::spawn2(298042,0,0,$x,$y,$z,$h);
     quest::targlobal($instid.'_manasipper',2,"H6",0,0,298);
  }
  if($qglobals{$instid.'_manasipper'} == 2) {   
     quest::delglobal($instid.'_manasipper');
  }
}  