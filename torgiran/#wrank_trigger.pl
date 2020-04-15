my $wcounter;
my $ocounter;

sub EVENT_SPAWN {
   $wcounter = 0;
   $ocounter = 0;
   quest::spawn2(226066,0,0,479,197,3,382); # NPC: #Overseer_Wrank
   }

sub EVENT_SIGNAL {
  if ($signal == 23) {
    $wcounter += 1;
}
  if ($signal == 24) {
    $wcounter += 2;
}
  if ($signal == 25) {
    $wcounter += 3;
}
  if ($signal == 26) {
    $wcounter += 4;
}
  if ($wcounter == 20 ) { 
    quest::spawn2(226109,0,0,109,62,2.7,430); # NPC: #Captain_Nago
    quest::spawn2(226203,0,0,109,195,2.7,430); # NPC: #Captain_Lung
    quest::spawn2(226202,0,0,220,195,2.7,430); # NPC: #Captain_Lkai
    quest::spawn2(226201,0,0,220,62,2.7,430); # NPC: #Captain_Flang
    quest::ze(0, "Overseer Wrank yells, 'Captains, stand at attention. There are invaders in the mines.'");
    $wcounter = 0;
}
  if ($signal == 33) {
    $ocounter += 1;
}
  if ($ocounter == 4 ) {
    quest::signalwith(226066,66,0); # NPC: #Overseer_Wrank
    quest::spawn2(226095,0,0,479,197,3,382); # NPC: Overseer_Wrank
    quest::depop_withtimer();
    quest::ze(0, "The ground trembles as the magic protecting Overseer Wrank fails.");
    $ocounter = 0;
}
 }
   
