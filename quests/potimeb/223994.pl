my $x;
my $y;
my $z;
my $h;

sub EVENT_SPAWN {
       quest::setnexthpevent(96);
}      

sub EVENT_HP {    
    if($hpevent == 96) {
        quest::setnexthpevent(81);
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(223112,0,0,$x - 10,$y,$z,$h);
        quest::spawn2(223112,0,0,$x + 10,$y,$z,$h);
}
    if($hpevent == 81) {
        quest::setnexthpevent(76);
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(223112,0,0,$x - 10,$y,$z,$h);
        quest::spawn2(223112,0,0,$x + 10,$y,$z,$h);
        quest::spawn2(223112,0,0,$x,$y - 10,$z,$h);
}

    if($hpevent == 76) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::depop();
        quest::spawn2(223993,0,0,$x,$y,$z,$h);
}
 }
 
sub EVENT_SIGNAL {
  if ($signal == 66){
     quest::depop();
 } 
  if ($signal == 1007){
     quest::start(2);
}
 }