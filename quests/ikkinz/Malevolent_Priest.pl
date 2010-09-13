my $counter = 0;

sub EVENT_SIGNAL {
  if ($signal == 1) { #Signal from death of Constrained_Servitor
    $counter += 1;
    }
  if($counter == 1) {
    $npc->SetHP(9000);
    }
  if($counter == 2) {
    $npc->SetHP(8000);
    }    
  if($counter == 3) {
    $npc->SetHP(7000);
    }    
  if($counter == 4) {
    $npc->SetHP(6000);
    }
  if($counter == 5) {
    $npc->SetHP(5000);
    }
  if($counter == 6) {
    $npc->SetHP(4000);
    }
  if($counter == 7) {
    $npc->SetHP(3000);
    }
  if($counter == 8) {
    $npc->SetHP(2000);
    }
  if($counter == 9) {
    $npc->SetHP(1100);
    quest::spawn2(294138,0,0,-16,-137,2,124);
    quest::spawn2(294138,0,0,-20,-276,2,0);
    quest::depopall(294085);
    }
}