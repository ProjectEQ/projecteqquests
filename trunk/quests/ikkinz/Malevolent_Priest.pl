my $counter = 0;

sub EVENT_SIGNAL {
  if ($signal == 1) { #Signal from death of Constrained_Servitor
    $counter += 1;
    }
  if($counter == 1) {
    $npc->SetHP(90000);
    }
  if($counter == 2) {
    $npc->SetHP(80000);
    }    
  if($counter == 3) {
    $npc->SetHP(70000);
    }    
  if($counter == 4) {
    $npc->SetHP(60000);
    }
  if($counter == 5) {
    $npc->SetHP(50000);
    }
  if($counter == 6) {
    $npc->SetHP(40000);
    }
  if($counter == 7) {
    $npc->SetHP(30000);
    }
  if($counter == 8) {
    $npc->SetHP(20000);
    }
  if($counter == 18) {
    $npc->SetHP(11000);
    quest::spawn2(294138,0,0,-16,-137,2,124);
    quest::spawn2(294138,0,0,-20,-276,2,0);
    quest::depopall(294085);
    }
}

