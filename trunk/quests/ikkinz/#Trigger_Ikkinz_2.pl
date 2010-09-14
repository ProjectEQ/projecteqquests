sub EVENT_SIGNAL {
  if ($signal == 1) { #Signal from death of Flesh_Hunter
    $counter += 1;
    }
   if($counter == 3) {
     quest::spawn2(294143,0,0,480,-592,-50,64);
     quest::spawn2(294144,0,0,476,-640,-50,58);
    }    
}
