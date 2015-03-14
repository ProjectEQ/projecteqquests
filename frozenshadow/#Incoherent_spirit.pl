#spawns Iucid spirit of Abrams upon death

sub EVENT_DEATH_COMPLETE {
     quest::spawn2(111147,0,0,$x,$y,$z,0);
}


