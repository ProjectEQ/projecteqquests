sub EVENT_SIGNAL {
  if ($signal == 1) { #Signal from death of each Vrex Sent
    $counter += 1;
    }
   if($counter == 4) {
     quest::spawn2(294594,0,0,480,-592,-50,64);
    }    
}
