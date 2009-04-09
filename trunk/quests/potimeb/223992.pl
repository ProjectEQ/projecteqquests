my $x;
my $y;
my $z;
my $h;

sub EVENT_SPAWN {
       $npc->SetHP(1000000);
       quest::setnexthpevent(46);
       quest::emote("roars in pain as his blue head explodes into pure ethereal energy!");
}

sub EVENT_HP {
    if($hpevent == 46) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(223112,0,0,$x - 10,$y,$z,$h);
        quest::spawn2(223112,0,0,$x + 10,$y,$z,$h);
        quest::setnexthpevent(31);
}

    if($hpevent == 31) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::spawn2(223112,0,0,$x - 10,$y,$z,$h);
        quest::spawn2(223112,0,0,$x + 10,$y,$z,$h);
        quest::spawn2(223112,0,0,$x,$y - 10,$z,$h);
        quest::setnexthpevent(26);
}

    if($hpevent == 26) {
        my $x = $npc->GetX();
        my $y = $npc->GetY();
        my $z = $npc->GetZ();
        my $h = $npc->GetHeading();
        quest::depop();
        quest::spawn2(223991,0,0,$x,$y,$z,$h);
}
 }
 
 sub EVENT_SIGNAL {
   if ($signal == 66){
      quest::depop();
 }
  }