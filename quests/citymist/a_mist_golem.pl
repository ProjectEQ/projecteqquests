sub EVENT_DEATH_COMPLETE{
 my $random_result = int(rand(100));
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ();
 my $h = $npc->GetHeading();
 if($random_result<15){
   quest::spawn2(90188,0,0,$x,$y,$z,$h);
}
 }