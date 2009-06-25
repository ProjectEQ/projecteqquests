# Spawns #an_enraged_vampire (111174) and maybe Tserrina
# Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 my $a = 111174;
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 quest::spawn2($a,0,0,$x,$y,$z,$h);
  if($random_result<16){
  quest::unique_spawn(111154,0,0,21.1,260.7,355.0);
  quest::delglobal("Tserr");
  quest::setglobal("Tserr",3,3,"F");
  $Tserr=undef;
}
}
# EOF zone: FrozenShadow