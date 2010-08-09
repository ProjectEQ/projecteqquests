sub EVENT_SPAWN {
  $counter = 0;
}

sub EVENT_SIGNAL {
  if($signal == 1) {
      $counter += 1;

if($counter == 100) {     
      quest::spawn2(290062,0,0,-1156,396,469,166);
      quest::ze(1,"A series of low chants comes to you from the Northeast, as Stonespiritist Ekikoa emerges from the shadows.");
}
}
}