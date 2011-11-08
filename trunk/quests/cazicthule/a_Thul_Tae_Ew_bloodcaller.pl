sub EVENT_AGGRO {
	quest::emote("babbles incoherently as it attacks!");
}

sub EVENT_DEATH {
   quest::emote("sprays black slime from its wounds and mouth!");
   my $random_result = int(rand(100));
   
   
   my $a = 48215;
    
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
   
   if ($random_result<=50){
      #Spawns my mob at the location that just died
      quest::spawn2($a,0,0,$x,$y,$z,$h);
   }
   else {
   }

} 