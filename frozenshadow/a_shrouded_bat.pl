# Spawns an_enraged_vampire (111173)
# Angelox

sub EVENT_DEATH_COMPLETE{
 my $a = 111173;
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 quest::spawn2($a,0,0,$x,$y,$z,$h);
}
# EOF zone: FrozenShadow