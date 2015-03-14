sub EVENT_SPAWN {
   $counter=0;
   quest::spawn_condition($zonesn,1,0);
   quest::settimer(1,1);
   my $x = $npc->GetX();
   my $y = $npc->GetY();
   my $range = 25;
   quest::set_proximity($x - $range, $x + $range, $y - $range, $y + $range);
}

sub EVENT_TIMER {
   if ($timer == 1) {
     $npc->SetAppearance(3);
     quest::stoptimer(1);
}
}

sub EVENT_ENTER {
  quest::spawn_condition($zonesn,1,1);
}
sub EVENT_SIGNAL {
  if($signal == 1) { 
     $counter += 1;
}
if($counter == 7) {
   quest::creategroundobject(52151,174,-910,-20,200,300000);
   quest::spawn_condition($zonesn,1,0);
   quest::depop_withtimer();
   }		
}