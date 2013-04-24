sub EVENT_SIGNAL {
  if ($signal == 1) { #Signal from death of Pixxt Priest Summoner
    $counter += 1;
    }
  if($counter == 1) {
    $npc->SetHP(900000);
    }
  if($counter == 2) {
    $npc->SetHP(800000);
    }    
  if($counter == 3) {
    $npc->SetHP(700000);
    }    
  if($counter == 4) {
    $npc->SetHP(600000);
    }
  if($counter == 5) {
    $npc->SetHP(500000);
    }
  if($counter == 6) {
    $npc->SetHP(400000);
    }
  if($counter == 7) {
    $npc->SetHP(300000);
    }
  if($counter == 8) {
    $npc->SetHP(200000);
    }
  if($counter == 9) {
    $npc->SetHP(100000);
    }
}
