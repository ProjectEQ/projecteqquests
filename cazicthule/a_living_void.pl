sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 8720 => 1)) {
     
   my $a = 48214;
    
   my $x = $npc->GetX();
   my $y = $npc->GetY();
   my $z = $npc->GetZ();
   my $h = $npc->GetHeading();
   
   quest::spawn2($a,0,0,$x,$y,$z,$h);
   }
}

#EOF