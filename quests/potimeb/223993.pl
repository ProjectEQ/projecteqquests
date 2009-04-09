my $x;
my $y;
my $z;
my $h;

sub EVENT_SPAWN {
       $npc->SetHP(1500000);
       quest::setnexthpevent(71);
       quest::emote("roars in pain as his red head explodes in a shower of flaming ethereal energy!");
}

sub EVENT_HP {
    if($hpevent == 71) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(223112,0,0,$x - 10,$y,$z,$h);
        quest::spawn2(223112,0,0,$x + 10,$y,$z,$h);
        quest::spawn2(223112,0,0,$x,$y - 10,$z,$h);
        quest::setnexthpevent(56);
}

    if($hpevent == 56) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(223112,0,0,$x - 10,$y,$z,$h);
        quest::spawn2(223112,0,0,$x + 10,$y,$z,$h);
        quest::spawn2(223112,0,0,$x,$y - 10,$z,$h);
        quest::spawn2(223112,0,0,$x,$y + 10,$z,$h);
        quest::setnexthpevent(51);
}

    if($hpevent == 51) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::depop();
        quest::spawn2(223992,0,0,$x,$y,$z,$h);
}
 }
 
 sub EVENT_SIGNAL {
   if ($signal == 66){
      quest::depop();
 }
}