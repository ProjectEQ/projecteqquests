my $counter = 0;

sub EVENT_SIGNAL {
  if ($signal == 1) { #Signal from death of Malevolent_Priest
    $counter += 1;
    }
   if($counter == 2) {
     quest::spawn2(294140,0,0,-7,-126,-2,129);
     quest::spawn2(294139,0,0,-9,-285,-2,251);
    }    
}