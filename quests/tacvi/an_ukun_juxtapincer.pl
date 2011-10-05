sub EVENT_SPAWN {
  if(!defined $qglobals{$instid.'_juxtapincer'}) {
     quest::targlobal($instid.'_juxtapincer',0,"H6",0,0,298); 
  }
}

sub EVENT_DEATH {
  if($qglobals{$instid.'_juxtapincer'} == 0) {
     quest::spawn2(298044,0,0,$x,$y,$z,$h);
     quest::targlobal($instid.'_juxtapincer',1,"H6",0,0,298);
  }
  if($qglobals{$instid.'_juxtapincer'} == 1) {
     quest::spawn2(298044,0,0,$x,$y,$z,$h);
     quest::targlobal($instid.'_juxtapincer',2,"H6",0,0,298);
  }
  if($qglobals{$instid.'_juxtapincer'} == 2) {   
     quest::delglobal($instid.'_juxtapincer');
  }
}  