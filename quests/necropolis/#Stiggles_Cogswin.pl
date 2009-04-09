my $x;
my $y;
my $z;
my $h;

sub EVENT_SPAWN {
     quest::setnexthpevent(50);
}

sub EVENT_HP {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
    if($hpevent == 50) {
      quest::spawn2(123151,0,0,$x,$y,$z,$h);
      quest::depop();         

} 
 }