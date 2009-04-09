sub EVENT_SPAWN {
   quest::set_proximity(25,25,25,25);
}

sub EVENT_ENTER {
   my $chance = int(ran(100));

   if($chance > 90) {
      quest::spawn2(218100,0,0,$x,$y,$z,$h);#Prismatic_Basilisk
      quest::depop();
   } else {
      quest::spawn2(218080,0,0,$x,$y,$z,$h);#Needlescale_Hatchling
      quest::depop();
   }
}
