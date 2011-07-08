sub EVENT_SPAWN {
  quest::depopall(297207);
}

sub EVENT_AGGRO {
  quest::settimer(1,2);
  quest::spawn2(297207,0,0,$x-5,$y-5,$z,$h);
  quest::spawn2(297207,0,0,$x-10,$y-10,$z,$h);
  quest::spawn2(297207,0,0,$x-15,$y-5,$z,$h);
  quest::spawn2(297207,0,0,$x-15,$y-15,$z,$h);
  quest::spawn2(297207,0,0,$x-5,$y-15,$z,$h);        
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::spawn2(297207,0,0,$x-5,$y-5,$z,$h);
  quest::spawn2(297207,0,0,$x-10,$y-10,$z,$h);
  quest::spawn2(297207,0,0,$x-15,$y-5,$z,$h);
  quest::spawn2(297207,0,0,$x-15,$y-15,$z,$h);
  quest::spawn2(297207,0,0,$x-5,$y-15,$z,$h);
  quest::spawn2(297207,0,0,$x,$y-5,$z,$h);
  quest::spawn2(297207,0,0,$x,$y-10,$z,$h);
  quest::spawn2(297207,0,0,$x-15,$y,$z,$h);
  quest::spawn2(297207,0,0,$x-15,$y-20,$z,$h);
  quest::spawn2(297207,0,0,$x-5,$y-10,$z,$h);
}