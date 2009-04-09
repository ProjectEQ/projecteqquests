#fourth bee

sub EVENT_DEATH {
   if(!defined $qglobals{bees}) {
     $x = $npc->GetX();

     $y = $npc->GetY();

     $z = $npc->GetZ();

     $h = $npc->GetHeading();
   
     quest::spawn2(71072,0,0,$x,$y,$z,$h);
     }
}