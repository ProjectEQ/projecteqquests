sub EVENT_SPAWN {
   quest::set_proximity(25,25,25,25);
}

sub EVENT_ENTER {
   my $chance = int(ran(100));

   if($chance > 90) {
      quest::spawn2(218052,0,0,$x,$y,$z,$h);#An_Ancient_Vekerchiki_Champion
      quest::depop();
   } else {
      quest::spawn2(218047,0,0,$x,$y,$z,$h);#A_Vekerchiki_Drone
      quest::depop();
   }
}